<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::group(['middleware' => 'auth:api'], function () {
    Route::post('logout', 'Auth\LoginController@logout');

    Route::get('/user', function (Request $request) {
        return $request->user();
    });

    Route::patch('settings/profile', 'Settings\ProfileController@update');
    Route::patch('settings/password', 'Settings\PasswordController@update');
});

Route::group(['middleware' => 'guest:api'], function () {
    Route::post('login', 'Auth\LoginController@login');
    Route::post('register', 'Auth\RegisterController@register');

    Route::post('password/email', 'Auth\ForgotPasswordController@sendResetLinkEmail');
    Route::post('password/reset', 'Auth\ResetPasswordController@reset');

    Route::post('email/verify/{user}', 'Auth\VerificationController@verify')->name('verification.verify');
    Route::post('email/resend', 'Auth\VerificationController@resend');

    Route::post('oauth/{driver}', 'Auth\OAuthController@redirectToProvider');
    Route::get('oauth/{driver}/callback', 'Auth\OAuthController@handleProviderCallback')->name('oauth.callback');
});

// mis rutas
// mostrar las bodegas
Route::get('/bodegas', 'BodegaController@index');
// Mostrar los usuarios ordenados
Route::get('/usuarios', 'UsuarioController@index');
// mostrar los productos por total
Route::get('/productos', 'ProductoController@index');
// Agregar una bodega
Route::post('/addBodega', 'BodegaController@store');
// Cambiar estado bodega
Route::post('updateBodega', 'BodegaController@cambiarEstado');
// Cambiar estado usuario
Route::post('updateUsuario', 'UsuarioController@cambiarEstado');
// Cambiar estado producto
Route::post('updateProducto', 'ProductoController@cambiarEstado');
// mostrar las bodegas que estén activas
Route::get('/bodegasActivas', 'BodegaController@bodegasActivas');
// mostrar los productos que estén activos
Route::get('/productosActivos', 'ProductoController@productosActivos');
// Agregar inventario
Route::post('/addInventario', 'InventarioController@store');
// Mostrar inventario
Route::get('/inventario', 'InventarioController@index');