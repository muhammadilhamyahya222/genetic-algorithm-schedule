<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cetak Jadwal Kuliah</title>
    <style>
        body { 
            font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif; 
            color: #333;
        }
        .container {
            max-width: 1200px;
            margin: 20px auto;
            padding: 15px;
        }
        .header {
            display: flex;
            align-items: center;
            justify-content: center;
            text-align: center;
            margin-bottom: 25px;
            position: relative;
        }
        .header img {
            position: absolute;
            left: 0;
            top: 50%;
            transform: translateY(-50%);
            height: 80px;
        }
        .header-text h2, .header-text h4 {
            margin: 0;
        }
        .jadwal-table {
            width: 100%;
            border-collapse: collapse;
            font-size: 11px;
        }
        .jadwal-table th, .jadwal-table td {
            border: 1px solid #ccc;
            padding: 6px 8px;
            text-align: center;
            vertical-align: middle;
        }
        .jadwal-table thead th {
            background-color: #f2f2f2;
            font-weight: bold;
        }
        /* Style baru untuk format teks jadwal */
        .jadwal-item .matkul { font-weight: bold; }
        .jadwal-item span { display: block; }

    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <img src="{{ public_path('img/logo-unej.png') }}" alt="Logo Universitas">
            <div class="header-text">
                <h2>JADWAL KULIAH SEMESTER {{ strtoupper($semester) }}</h2>
                <h4>TAHUN AJARAN {{ $tahun_ajaran }}</h4>
            </div>
        </div>

        <table class="jadwal-table">
            <thead>
                <tr>
                    <th style="width: 8%;">Hari</th>
                    <th style="width: 7%;">Jam</th>
                    @foreach ($rooms as $room)
                        <th>{{ $room }}</th>
                    @endforeach
                </tr>
            </thead>
            <tbody>
                @php 
                    $lastDay = ''; 
                    // Normalisasi data dari controller untuk dicocokkan
                    $normalizedDays = collect($days)->map(fn($day) => strtolower(trim($day)));
                    $normalizedRooms = collect($rooms)->map(fn($room) => trim($room));
                @endphp
                @foreach ($normalizedDays as $day)
                    @foreach ($timeSlots as $timeIndex => $time)
                        <tr>
                            @if ($day !== $lastDay)
                                <td rowspan="{{ count($timeSlots) }}">{{ ucfirst($day) }}</td>
                                @php $lastDay = $day; @endphp
                            @endif

                            <td>{{ $time }}</td>

                            @foreach ($normalizedRooms as $room)
                                @if (isset($scheduleMap[$day][$room][$time]))
                                    @php $item = $scheduleMap[$day][$room][$time]; @endphp
                                    <td rowspan="{{ $item->rowspan > 0 ? $item->rowspan : 1 }}">
                                        {{-- PERUBAHAN DI SINI: Gunakan format baru --}}
                                        <div class="jadwal-item">
                                            <span class="matkul">{{ $item->matkul }}</span>
                                            <span>({{ $item->kode_prodi }} Semester {{ $item->perkuliahan_semester }})</span>
                                            <span>{{ $item->jenis }}</span>
                                            <span>{{ $item->kelas }}</span>
                                        </div>
                                    </td>
                                @else
                                    @php
                                        $isOccupiedByRowspan = false;
                                        for ($i = 1; $i <= $timeIndex; $i++) {
                                            $prevTime = $timeSlots[$timeIndex - $i] ?? null;
                                            if ($prevTime && isset($scheduleMap[$day][$room][$prevTime])) {
                                                if ($scheduleMap[$day][$room][$prevTime]->rowspan > $i) {
                                                    $isOccupiedByRowspan = true;
                                                    break;
                                                }
                                            }
                                        }
                                    @endphp
                                    @if (!$isOccupiedByRowspan)
                                        <td></td>
                                    @endif
                                @endif
                            @endforeach
                        </tr>
                    @endforeach
                @endforeach
            </tbody>
        </table>
    </div>
</body>
</html>
