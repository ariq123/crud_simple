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
        Schema::create('inventories', function (Blueprint $table) {
            $table->id();
            $table->enum('namabarang', [
                            'Kopi' => 'Kopi',
                            'Teh' => 'Teh',
                            'Pasta Gigi' => 'Pasta Gigi',
                            'Sabun Mandi' => 'Sabun Mandi',
                            'Sampo' => 'Sampo',]);
            $table->string('stok');
            $table->string('jumlahterjual');
            $table->date('tanggaltransaksi');
            $table->enum('jenisbarang', [
                            'Pembersih',
                            'Konsumsi']);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('inventories');
    }
};
