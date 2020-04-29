<?php

namespace App\Http\Controllers;

use App\Inventario;
use Illuminate\Http\Request;

class InventarioController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        if($request->wantsJson())
        {
            $inventario = Inventario::selectRaw('bodegas.nombre as bodega,productos.nombre as producto,inventarios.cantidad,inventarios.created_at as fecha')->join('bodegas','inventarios.id_bodega','=','bodegas.id')->join('productos', 'inventarios.id_producto', '=', 'productos.id')->orderBy('bodegas.nombre','asc')->orderBy('productos.nombre','asc')->get();
            return response()->json($inventario, 200);
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
        if($request->wantsJson())
        {
            $id_bodega = $request->input('bodega_select');
            $id_producto = $request->input('producto_select');
            $cantidad = $request->input('cantidad');
            try {
                $consulta = Inventario::where('id_bodega', '=', $id_bodega)->where('id_producto', '=', $id_producto)->exists();
                if($consulta) {
                    // extraemos el valor cantidad del registro
                    $queryCant = Inventario::select('cantidad')->where('id_bodega', '=', $id_bodega)->where('id_producto', '=', $id_producto)->first();
                    $total = $queryCant->cantidad + $cantidad;
                    // Actualizamos la cantidad del registro con la que nos envia el formulario.
                    $update = Inventario::where('id_bodega', '=', $id_bodega)->where('id_producto', '=', $id_producto)->update(['cantidad' => $total]);
                    return response()->json(["mensaje" => 'Inventario actualizado'], 200);
                    return;
                }
                // Creamos un nuevo registro si la combinacion bodega -> producto no existe.
                $inventario = new Inventario();
                $inventario->id_bodega = $id_bodega;
                $inventario->id_producto = $id_producto;
                $inventario->cantidad = $cantidad;
                $inventario->save();
                return response()->json([
                    "mensaje" => 'Inventario agregado',
                    "inventario" => $inventario
                ], 200);
            
            } catch (Exception $e) {
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
