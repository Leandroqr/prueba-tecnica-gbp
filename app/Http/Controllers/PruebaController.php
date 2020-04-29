<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class PruebaController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    
    public function index(Request $request)
    {
        // $nombres = ['Juan','Pedro','Lucas'];
        // // return view('/index', compact('nombres'));
        // return $nombres;
        // return 'Estoy dentro de clientes prueba controller';
        if($request->wantsJson()) {
            // return $nombres = ['Juan','Pedro','Lucas'];
            return response()->json([
                // ['bodega' => 'Bodega 1', 'producto' => 'MFDA12678934501', 'cantidad' => 5, 'fecha' => '15/04/2020'],
                // ['bodega' => 'Bodega 2', 'producto' => 'MFDA12678934502', 'cantidad' => 15, 'fecha' => '15/04/2020'],
                // ['bodega' => 'Bodega 3', 'producto' => 'MFDA12678934503', 'cantidad' => 25, 'fecha' => '15/04/2020']
                    ['name' => 'Leandro', 'activo' => false],
                    ['name' => 'Juan', 'activo' => true]
                ]);
            
            // return view('/index');
        }
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
