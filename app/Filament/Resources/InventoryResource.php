<?php

namespace App\Filament\Resources;

use Filament\Forms;
use Filament\Tables;
use Filament\Forms\Form;
use App\Models\Inventory;
use Filament\Tables\Table;
use Filament\Resources\Resource;
use Filament\Forms\Components\Card;
use Filament\Tables\Filters\Filter;

use function Laravel\Prompts\table;
use function Laravel\Prompts\select;
use Filament\Forms\Components\Select;
use Rupadana\ApiService\Http\Handlers;
use Filament\Tables\Columns\TextColumn;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Components\DatePicker;
use Filament\Tables\Filters\SelectFilter;
use Illuminate\Database\Eloquent\Builder;
use Filament\Forms\Components\Placeholder;
use Filament\Tables\Filters\TernaryFilter;
use App\Filament\Resources\InventoryResource\Pages;
use Illuminate\Database\Eloquent\SoftDeletingScope;
use App\Filament\Resources\InventoryResource\RelationManagers;

class InventoryResource extends Resource
{

    protected static ?string $model = Inventory::class;

    protected static ?string $navigationIcon = 'heroicon-o-rectangle-stack';
    public static bool $public = true;

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                   Card::make()
                    ->schema([
                        Select::make('namabarang')->options([
                            'Kopi' => 'Kopi',
                            'Teh' => 'Teh',
                            'Pasta Gigi' => 'Pasta Gigi',
                            'Sabun Mandi' => 'Sabun Mandi',
                            'Sampo' => 'Sampo',
                        ])->required(),
                        TextInput::make('stok')->required(),
                        TextInput::make('jumlahterjual')->required(),
                        DatePicker::make('tanggaltransaksi') ->timezone('Asia/Jakarta')->required(),
                        Select::make('jenisbarang')->options([
                            'Pembersih' => 'Pembersih',
                            'Konsumsi' => 'Konsumsi'
                        ])->required()
                    ])
                    ->columns(2),
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                TextColumn::make('namabarang')->sortable()->searchable(),
                TextColumn::make('stok')->sortable()->searchable(),
                TextColumn::make('jumlahterjual')->sortable()->searchable(),
                TextColumn::make('tanggaltransaksi')->sortable()->searchable(),
                TextColumn::make('jenisbarang')->sortable()->searchable(),
            ])
            ->filters([
                SelectFilter::make('Nama Barang')->multiple()
                ->options([
                    'Kopi' => 'Kopi',
                    'Teh' => 'Teh',
                    'Pasta Gigi' => 'Pasta Gigi',
                    'Sabun Mandi' => 'Sabun Mandi',
                    'Sampo' => 'Sampo',
                ])->searchable()->preload()
                ->attribute('namabarang'),
                SelectFilter::make('Jenis Barang')->multiple()
                ->options([
                    'Pembersih' => 'Pembersih',
                    'Konsumsi' => 'Konsumsi'
                ])->searchable()->preload()
                ->attribute('jenisbarang'),
   
                
                Filter::make('tanggaltransaksi')
                ->form([
                    DatePicker::make('created_from'),
                    DatePicker::make('created_until'),
                ])
                ->query(function (Builder $query, array $data): Builder {
                    return $query
                        ->when(
                            $data['created_from'],
                            fn(Builder $query, $date): Builder => $query->whereDate('tanggaltransaksi', '>=', $date),
                        )
                        ->when(
                            $data['created_until'],
                            fn(Builder $query, $date): Builder => $query->whereDate('tanggaltransaksi', '<=', $date),
                        );
                })
            ])
            ->actions([
                Tables\Actions\EditAction::make(),
                Tables\Actions\DeleteAction::make(),
            ])
            ->bulkActions([
                Tables\Actions\BulkActionGroup::make([
                    Tables\Actions\DeleteBulkAction::make(),
                ]),
            ]);
    }

    public static function getRelations(): array
    {
        return [
            //
        ];
    }

    public static function getPages(): array
    {
        return [
            'index' => Pages\ListInventories::route('/'),
            'create' => Pages\CreateInventory::route('/create'),
            'edit' => Pages\EditInventory::route('/{record}/edit'),
        ];
    }
    
    
}
