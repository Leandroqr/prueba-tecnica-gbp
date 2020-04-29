<?php

namespace App\Http\Controllers;

use App\Bodega;
// use App\Usuario;
use Illuminate\Http\Request;

class BodegaController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        if ($request->wantsJson())
        {
            $bodegas = Bodega::join('users', 'bodegas.id_responsable', '=', 'usuarios.id')->select('bodegas.*','usuarios.foto','users.nombre as nombre_user')->get();
            return response()->json($bodegas, 200);
        }
    }

    public function bodegasActivas(Request $request) 
    {
        if ($request->wantsJson())
        {
            $bodegas = Bodega::where('estado', '=', 1)->get();
            return response()->json($bodegas, 200);
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
        if ($request->wantsJson()) 
        {
            try {
                $bodega = new Bodega();
                $bodega->nombre = $request->input('nom_bodega');
                $bodega->estado = 1;
                $bodega->id_responsable = $request->input('responsable');
                $bodega->save();
                return response()->json([
                    "mensaje" => 'Bodega creada',
                    "bodega" => $bodega
                ], 200);
            }
            catch(Exception $e) {
                report($e);
            }
            
        }
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
    public function cambiarEstado(Request $request)
    {
        $id = $request->input('idBodega');
        $estado = $request->input('estado');
        $bodega = Bodega::where('id',$id)->update(['estado' => $estado]);
        return response()->json(["mensaje" => 'Estado Actualizado'], 200);
    }
    public function update(Request $request)
    {
        
       
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
