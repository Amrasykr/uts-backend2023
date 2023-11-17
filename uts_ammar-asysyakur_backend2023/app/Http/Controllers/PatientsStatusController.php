<?php

namespace App\Http\Controllers;

use App\Models\Patients;
use App\Models\PatientsRoom;
use App\Models\PatientsStatus;
use Illuminate\Http\Request;

class PatientsStatusController extends Controller
{
    public function index()
    {
        $patientsStatus = PatientsStatus::all();

		if ($patientsStatus->count() > 0) {
			$response= [
				'message' => 'Menampilkan semua data pasien',
				'data' => $patientsStatus,
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
            'status' => 'required',
        ]);

        $patientsStatus = PatientsStatus::create($validateData);

        $data = [
            'messages' => 'Berhasil menambahkan data pasien',
            'data' => $patientsStatus
        ];
        
        return response()->json($data, 201);
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //
    }
}
