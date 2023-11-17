<?php

use App\Http\Controllers\AuthController;
use App\Http\Controllers\PatientsController;
use App\Http\Controllers\PatientsRoomController;
use App\Http\Controllers\PatientsStatusController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/


// autentikasi dengan sanctum
Route::middleware(['auth:sanctum'])->group(function () {

    Route::get('/patients', [PatientsController::class, 'index']);
    Route::get('/patients/{id}', [PatientsController::class, 'show']);
    Route::put('/patients/{id}', [PatientsController::class, 'update']);
    Route::delete('/patients/{id}', [PatientsController::class, 'destroy']);
    Route::post('/patients', [PatientsController::class, 'store']);
    Route::get('/patients/search/{name}', [PatientsController::class, 'search']);
    Route::get('/patients/status/positive', [PatientsController::class, 'positive']);
    Route::get('/patients/status/recovered', [PatientsController::class, 'recovered']);
    Route::get('/patients/status/dead', [PatientsController::class, 'dead']);

    Route::get('/statuses', [PatientsStatusController::class, 'index']);
    Route::post('/statuses', [PatientsStatusController::class, 'store']);

    Route::get('/rooms', [PatientsRoomController::class, 'index']);
    Route::post('/rooms', [PatientsRoomController::class, 'store']);

});


// login dan register menggunakan sanctum
Route::post('/register', [AuthController::class, 'register']);
Route::post('/login', [AuthController::class, 'login']);