<?php

namespace App\Exports;

use Maatwebsite\Excel\Concerns\FromArray;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Maatwebsite\Excel\Concerns\WithEvents;
use Maatwebsite\Excel\Events\AfterSheet;
use PhpOffice\PhpSpreadsheet\Style\Alignment;
use PhpOffice\PhpSpreadsheet\Style\Border;
use PhpOffice\PhpSpreadsheet\Worksheet\Drawing;

class JadwalExport implements FromArray, WithHeadings, WithEvents
{
    protected array $data;

    public function __construct(array $processedData)
    {
        $this->data = $processedData;
    }

    public function array(): array
    {
        $days = $this->data['days'];
        $timeSlots = $this->data['timeSlots'];
        $rooms = $this->data['rooms'];
        $scheduleMap = $this->data['scheduleMap'];

        $exportData = [];
        $lastDay = '';

        $normalizedDays = collect($this->data['days'])->map(function($day) {
            return strtolower(trim($day));
        });
        
        foreach ($normalizedDays as $day) {
            foreach ($timeSlots as $time) {
                $formattedTime = $time; 
                $row = [];
                
                $displayDay = ucfirst($day);
                $row[] = ($displayDay !== $lastDay) ? $displayDay : '';
                $lastDay = $displayDay;

                $row[] = $formattedTime;

                foreach ($rooms as $room) {
                    $normalizedRoom = trim($room);
                    if (isset($scheduleMap[$day][$normalizedRoom][$formattedTime])) {
                        $item = $scheduleMap[$day][$normalizedRoom][$formattedTime];
                        $row[] = $item->displayText;
                    } else {
                        $row[] = '';
                    }
                }
                $exportData[] = $row;
            }
        }
        return $exportData;
    }

    public function headings(): array
    {
        $semester = ucfirst($this->data['semester']);
        $tahun = $this->data['tahun_ajaran'];
        $tableHeader = ['Hari', 'Jam'];
        foreach ($this->data['rooms'] as $room) {
            $tableHeader[] = $room;
        }
        return [
            ['Fakultas Ilmu Komputer Universitas Jember'],
            ['Kampus Tegalboto, Jl. Kalimantan No.37, Krajan Timur, Sumbersari, Kec. Sumbersari, Kabupaten Jember, Jawa Timur 68121'],
            ["Jadwal Kuliah Semester {$semester} - Tahun {$tahun}"],
            [],
            $tableHeader,
        ];
    }
    
    public function registerEvents(): array
    {
        $data = $this->data;
        $totalColumns = 2 + count($data['rooms']);
        $headerRowCount = 5;

        return [
            AfterSheet::class => function(AfterSheet $event) use ($data, $totalColumns, $headerRowCount) {
                $sheet = $event->sheet->getDelegate();
                $lastColumnLetter = \PhpOffice\PhpSpreadsheet\Cell\Coordinate::stringFromColumnIndex($totalColumns);

                $drawing = new Drawing();
                $drawing->setName('Logo Universitas');
                $drawing->setPath(public_path('img/logo-unej.png'));
                $drawing->setHeight(60);
                $drawing->setCoordinates('A1');
                $drawing->setWorksheet($sheet);
                
                $sheet->mergeCells("A1:{$lastColumnLetter}1");
                $sheet->mergeCells("A2:{$lastColumnLetter}2");
                $sheet->mergeCells("A3:{$lastColumnLetter}3");
                $sheet->getStyle("A1:{$lastColumnLetter}3")->getFont()->setBold(true)->setSize(10);
                $sheet->getStyle("A1:{$lastColumnLetter}3")->getAlignment()->setHorizontal(Alignment::HORIZONTAL_CENTER);

                $headerRow = "A{$headerRowCount}:{$lastColumnLetter}{$headerRowCount}";
                $sheet->getStyle($headerRow)->getFont()->setBold(true);
                $sheet->getStyle($headerRow)->getAlignment()->setHorizontal(Alignment::HORIZONTAL_CENTER)->setVertical(Alignment::VERTICAL_CENTER);
                $sheet->getStyle($headerRow)->getAlignment()->setWrapText(true);

                $currentRow = $headerRowCount + 1;

                $timeSlotsArray = $data['timeSlots']->toArray();
                $normalizedDays = collect($this->data['days'])->map(fn($day) => strtolower(trim($day)));

                $rowHeights = [];

                foreach ($normalizedDays as $day) {
                    $dayRowCount = count($data['timeSlots']);
                    if ($dayRowCount > 1) {
                        $sheet->mergeCells("A{$currentRow}:A" . ($currentRow + $dayRowCount - 1));
                    }
                    $sheet->getStyle("A{$currentRow}")->getAlignment()->setVertical(Alignment::VERTICAL_CENTER)->setHorizontal(Alignment::HORIZONTAL_CENTER);
                    
                    foreach ($data['timeSlots'] as $timeIndex => $time) {
                        $currentCellRow = $currentRow + $timeIndex;
                        $formattedTime = $time;

                        foreach ($data['rooms'] as $roomIndex => $room) {
                            $normalizedRoom = trim($room);
                            if (isset($data['scheduleMap'][$day][$normalizedRoom][$formattedTime])) {
                                $item = $data['scheduleMap'][$day][$normalizedRoom][$formattedTime];
                                
                                $jamMasuk = date('H:i', strtotime($item->jam_masuk));
                                $jamKeluar = date('H:i', strtotime($item->jam_keluar));
                                $rowspan = 0;
                                
                                $startIndex = array_search($jamMasuk, $timeSlotsArray);

                                if ($startIndex !== false) {
                                    for ($i = $startIndex; $i < count($timeSlotsArray); $i++) {
                                        if (strtotime($timeSlotsArray[$i]) < strtotime($jamKeluar)) {
                                            $rowspan++;
                                        } else {
                                            break;
                                        }
                                    }
                                }
                                if ($rowspan < 1) $rowspan = 1;

                                if ($rowspan > 1) {
                                    $colLetter = \PhpOffice\PhpSpreadsheet\Cell\Coordinate::stringFromColumnIndex(3 + $roomIndex);
                                    $startCell = "{$colLetter}{$currentCellRow}";
                                    $endCell = "{$colLetter}" . ($currentCellRow + $rowspan - 1);
                                    $sheet->mergeCells("{$startCell}:{$endCell}");
                                }
                                
                                $lineCount = substr_count($item->displayText, "\n") + 1;
                                $totalRequiredHeight = $lineCount * 25;
                                $heightPerMergedRow = $totalRequiredHeight / $rowspan;

                                for ($i = 0; $i < $rowspan; $i++) {
                                    $targetRow = $currentCellRow + $i;
                                    $rowHeights[$targetRow] = max($rowHeights[$targetRow] ?? 15, $heightPerMergedRow);
                                }
                            }
                        }
                    }
                    $currentRow += $dayRowCount;
                }

                foreach($rowHeights as $rowIndex => $height) {
                    $sheet->getRowDimension($rowIndex)->setRowHeight($height);
                }
                
                $lastDataRow = $sheet->getHighestRow();
                $fullTableRange = "A{$headerRowCount}:{$lastColumnLetter}{$lastDataRow}";
                
                $sheet->getStyle($fullTableRange)->applyFromArray([
                    'borders' => ['allBorders' => ['borderStyle' => Border::BORDER_THIN]],
                ]);

                $dataRange = "A" . ($headerRowCount + 1) . ":{$lastColumnLetter}{$lastDataRow}";
                $sheet->getStyle($dataRange)->getAlignment()->setWrapText(true);
                $sheet->getStyle($dataRange)->getAlignment()->setVertical(Alignment::VERTICAL_CENTER)->setHorizontal(Alignment::HORIZONTAL_CENTER);

                $sheet->getColumnDimension('A')->setWidth(12);
                $sheet->getColumnDimension('B')->setWidth(10);
                for ($i = 3; $i <= $totalColumns; $i++) {
                    $sheet->getColumnDimension(\PhpOffice\PhpSpreadsheet\Cell\Coordinate::stringFromColumnIndex($i))->setWidth(25);
                }
            }
        ];
    }
}
