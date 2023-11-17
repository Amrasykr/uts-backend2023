<?php

namespace App\Http\Controllers;

use App\Models\Patients;
use App\Models\PatientsRoom;
use App\Models\PatientsStatus;
use Illuminate\Http\Request;

class PatientsRoomController extends Controller
{

    public function index()
    {
        $patientsRoom = PatientsRoom::all();

		if ($patientsRoom->count() > 0) {
			$response= [
				'message' => 'Menampilkan semua data pasien',
				'data' => $patientsRoom,
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
            'no_room' => 'required',
            'floor' => 'required',
            'class' => 'required',
        ]);

        $patientsRoom = PatientsRoom::create($validateData);

        $data = [
            'messages' => 'Berhasil menambahkan data pasien',
            'data' => $patientsRoom
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
