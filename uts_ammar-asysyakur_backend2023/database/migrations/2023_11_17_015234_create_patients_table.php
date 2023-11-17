<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
       Schema::create('patients', function (Blueprint $table) {
        $table->id();
        $table->string('name')->nullable();
        $table->string('phone')->nullable();
        $table->text('address')->nullable();
        $table->unsignedBigInteger('status_id')->nullable(); 
        $table->unsignedBigInteger('room_id'); 
        $table->date('in_date_at')->nullable();
        $table->date('out_date_at')->nullable();
        $table->timestamps();

        $table->foreign('status_id')->references('id')->on('patients_statuses');
        $table->foreign('room_id')->references('id')->on('patients_rooms');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('patients');
    }
};
