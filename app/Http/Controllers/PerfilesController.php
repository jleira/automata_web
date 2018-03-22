<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Http\Requests;
use DB;
use Auth;
class PerfilesController extends Controller
{
       /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return Response
     */
    public function roles()
    {
        $perfiles=DB::table('listas')->where('id_tipo',1)->get();
        return view('perfiles.roles')->with(array('roles'=>$perfiles));
    }
    public function usuarios()
    {

        $items=DB::table('users')->where('id_empresa',Auth::user()->id_empresa)->get();
        return view('perfiles.usuarios')->with(array('items'=>$items));
    }
    public function nuevousuario(Request $request)
    {
        $this->validate($request, [
            'nombre' => 'required',
            'nick' => 'required|unique:users,nick',
            'correo' => 'required|email|unique:users,email',
            'password' => 'required|confirmed|min:6',
        ]);
              $administrador='';
            if($request->has('administrador')){
              $administrador=0;
            }
//            DB::table('users')->insert([['nombre'=>strtoupper($request->nombre),
//            'descripcion'=>strtoupper($request->descripcion),'vl_mayorista'=>str_replace('.','',$request->vrmayorista),'vl_unitario'=>str_replace('.','',$request->vrunitario),'vl_minorista'=>str_replace('.','',$request->vrminorista),
//            'imagen'=>$linki,'fecha_registro'=>Carbon::today(),'categoria'=>$request->categoria ]]);



    }
}
