<?php

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It's a breeze. Simply tell Laravel the URIs it should respond to
| and give it the controller to call when that URI is requested.
|
*/



Route::auth();

Route::get('/home', 'HomeController@index');
Route::get('/', 'HomeController@index');

//productos
Route::get('productos','ProductosController@index');
Route::get('producto/clientes', 'ProductosController@index');
Route::get('producto/proveedores', 'ProductosController@index');

Route::get('producto/nuevo', 'ProductosController@nuevo');
Route::get('producto/nuevo/cliente', 'ProductosController@nuevo');
Route::get('producto/nuevo/proveedor', 'ProductosController@nuevo');
Route::post('productos/nuevo/registrar', 'ProductosController@crear');

Route::get('producto/perfil/{id}', 'ProductosController@perfil');
Route::get('producto/perfil/{id}/editar', 'ProductosController@editar');
Route::post('producto/perfil/{id}/editar', 'ProductosController@actualizar');

//bodegas
Route::get('bodegas', 'BodegasController@index');
Route::get('bodega/nuevo', 'BodegasController@nuevo');
Route::post('bodegas/nuevo/registrar', 'BodegasController@crear');
Route::get('bodega/perfil/{id}', 'BodegasController@perfil');
Route::get('bodega/perfil/{id}/editar', 'BodegasController@editar');
Route::post('bodega/perfil/{id}/editar', 'BodegasController@actualizar');

Route::post('/editarstorage', 'BodegasController@editar');

//contactos
Route::get('contactos','ContactosController@index');
Route::get('contacto/clientes', 'ContactosController@index');
Route::get('contacto/proveedores', 'ContactosController@index');

Route::get('contacto/nuevo', 'ContactosController@nuevo');
Route::get('contacto/nuevo/cliente', 'ContactosController@nuevo');
Route::get('contacto/nuevo/proveedor', 'ContactosController@nuevo');
Route::post('contactos/nuevo/registrar', 'ContactosController@crear');

Route::get('contacto/perfil/{id}', 'ContactosController@perfil');
Route::get('contacto/perfil/{id}/editar', 'ContactosController@editar');
Route::post('contacto/perfil/{id}/editar', 'ContactosController@actualizar');

Route::get('perfiles/roles', 'PerfilesController@roles');
Route::get('perfiles/usuarios', 'PerfilesController@usuarios');
Route::post('perfiles/usuarios/nuevousuario', 'PerfilesController@nuevousuario');

Route::group(['prefix' => 'api'], function () {
    Route::post('login','MovilController@login');
    Route::get('empresasactivas','MovilController@empresasactivas');

});
//materiales
Route::get('materiales','MaterialController@index');
Route::get('material/nuevo', 'MaterialController@nuevo');
Route::post('material/nuevo/registrar', 'MaterialController@nuevomaterial');
Route::get('material/nuevacategoria', 'MaterialController@categorias');
Route::post('material/nuevacategoria', 'MaterialController@nuevacategoria');
Route::post('material/editarcategoria', 'MaterialController@editarcategoria');



//moviles