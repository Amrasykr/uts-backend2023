<?php

namespace App\Http\Controllers;

use App\Models\Patients;
use App\Models\PatientsRoom;
use App\Models\PatientsStatus;
use Illuminate\Http\Request;

class PatientsController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        
        $patients = Patients::all();

		if ($patients->count() > 0) {
			$response= [
				'message' => 'Menampilkan semua data pasien',
				'data' => $patients,
			];
			return response()->json($response, 200);
		} else {
			$response = [
				'message' => 'Data tidak ada'
			];
			return response()->json($response, 200);
		} 

    }

    public function store(Request $request)
    {
        $validateData = $request->validate([
            'name' => 'required',
            'phone' => 'required| numeric',
            'address' => 'required',
            'status_id' => 'required| numeric' ,
            'room_id' => 'required| numeric',
            'in_date_at' => 'required',
        ]);

        $patients = Patients::create($validateData);
        $patientsStatus = PatientsStatus::find($validateData['status_id']);
        $patientsRoom = PatientsRoom::find($validateData['room_id']);


        $data = [
            'messages' => 'Berhasil menambahkan data pasien',
            'data' => [
                        'patient' => $patients,
                        'status' => $patientsStatus,
                        'room' => $patientsRoom,
                    ],
        ];
        
        return response()->json($data, 201);
    }


    public function show(string $id)
    {
        $patients = Patients::find($id);
        $patientsStatus = PatientsStatus::find($patients['status_id']);
        $patientsRoom = PatientsRoom::find($patients['room_id']);

        if ($patients) {
            $response = [
                'message' => 'Berhasil menampilkan data student dengan ID ' . $id,
                'data' => [
                    'patients' => $patients,
                    'status' => $patientsStatus,
                    'room' => $patientsRoom,
                ],
            ];
            return response()->json($response,200);

        } else {
            $response = [
                'message' => 'Siswa dengan ID ' . $id . ' tidak ditemukan',
                'data' => null
            ];
            return response()->json($response, 204);
        }
    }

    public function update(Request $request, string $id)
    {
        $patients = Patients::find($id);
        $patientsStatus = PatientsStatus::find($patients['status_id']);
        $patientsRoom = PatientsRoom::find($patients['room_id']);
        if ($patients) {
            $patients->update([
                'name' => $request->name ?? $patients->name,
                'phone' => $request->phone ?? $patients->phone,
                'address' => $request->address ?? $patients->address,
                'status_id' => $request->status ?? $patients->status_id,
                'room_id' => $request->room_id ?? $patients->room_id,
                'in_date_at' => $request->in_date_at ?? $patients->in_date_at,
                'out_date_at' => $request->out_date_at ?? $patients->out_date_at,
            ]);
            $response = [
                'message' => 'Berhasil mengupdate data pasien',
                'data' => [
                            'patients' => $patients,
                            'status' => $patientsStatus,
                            'room' => $patientsRoom,
                        ],
            ];
            return response()->json($response, 200);

        } else {
            $response = [
                'message' => 'Data pasien tidak ditemukan',
            ];

            return response()->json($response, 400);
        }
    }

    public function destroy(string $id)
    {
        $patients = Patients::find($id);
        $patientsStatus = PatientsStatus::find($patients['status_id']);
        $patientsRoom = PatientsRoom::find($patients['room_id']);

        if (!$patients) {
             $data = [
                'message' => 'Data pasien tidak ditemukan',
            ];

            return response()->json($data, 400);

        } else {
            $patients->delete();

            $response = [
                'message' => 'Berhasil menghapus data pasien dengan ID'. $id,
                    'data' => [
                            'patients' => $patients,
                            'status' => $patientsStatus,
                            'room' => $patientsRoom,
                        ],
            ];
            return response()->json($response, 200);
        }
    }

    public function search(Request $request)
    {
        $name = $request->input('name');

        $patients = Patients::where('name', 'LIKE', "%$name%")->get();

        if ($patients->isEmpty()) {
            return response()->json(['message' => 'Data pasien tidak ditemukan'], 404);
        }

        $patientsData = [];

        foreach ($patients as $patient) {
            $patientsStatus = PatientsStatus::find($patient->status_id);
            $patientsRoom = PatientsRoom::find($patient->room_id);

            $patientData = [
                'patient' => $patient,
                'status' => $patientsStatus,
                'room' => $patientsRoom,
            ];

            $patientsData[] = $patientData;
        }

        return response()->json([
            'message' => 'Berhasil menemukan data pasien berdasarkan nama',
            'data' => $patientsData,
        ], 200);

    }

    public function positive()
    {
        $positiveStatusId = 1; 
        $positivePatients = Patients::where('status_id', $positiveStatusId)->get();

        if ($positivePatients->isEmpty()) {
            return response()->json(['message' => 'Tidak ada pasien dengan status positif'], 404);
        }

        return response()->json([
            'message' => 'Data pasien dengan status positif berhasil diambil',
            'data' => $positivePatients,
        ], 200);    
    }

    public function recovered()
    {
        $recoveredStatusId = 2; 
        $recoveredPatients = Patients::where('status_id', $recoveredStatusId)->get();

        if ($recoveredPatients->isEmpty()) {
            return response()->json(['message' => 'Tidak ada pasien dengan status sembuh'], 404);
        }

        return response()->json([
            'message' => 'Data pasien dengan status sembuh berhasil diambil',
            'data' => $recoveredPatients,
        ], 200);    
    }

    public function dead()
    {
        $deadStatusId = 3; 
        $deadPatients = Patients::where('status_id', $deadStatusId)->get();

        if ($deadPatients->isEmpty()) {
            return response()->json(['message' => 'Tidak ada pasien dengan status meninggal'], 404);
        }

        return response()->json([
            'message' => 'Data pasien dengan status sembuh berhasil diambil',
            'data' => $deadPatients,
        ], 200);    
    }

}
