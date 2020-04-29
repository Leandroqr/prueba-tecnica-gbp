<?php

namespace App\Http\Controllers;

use App\Producto;
use App\Inventario;
use Illuminate\Http\Request;

class ProductoController extends Controller
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
            $productos = Inventario::selectRaw('sum(inventarios.cantidad) as total, productos.*')->join('productos', 'inventarios.id_producto', '=', 'productos.id')->groupBy('inventarios.id_producto')->orderBy('inventarios.id_producto', 'desc')->get();
            return response()->json($productos, 200);
        }
    }

    public function productosActivos(Request $request)
    {
        if ($request->wantsJson())
        {
            $productos = Producto::where('estado','=',1)->get();
            return response()->json($productos, 200);
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

    public function cambiarEstado(Request $request)
    {
        $id = $request->input('idProduct');
        $estado = $request->input('estado');
        $producto = Producto::where('id',$id)->update(['estado' => $estado]);
        return response()->json(["mensaje" => 'Estado Actualizado'], 200);
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
