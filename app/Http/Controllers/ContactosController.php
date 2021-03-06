<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Requests;
use DB;
use View;
use Auth;


class ContactosController extends Controller
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
    public function index()
    {
   	$tipo=[1,2,3];
   	$contact='contact';
   	$url= $_SERVER["REQUEST_URI"];
    $poscliente = strpos($url, 'clientes');
    if ($poscliente !== false) {
   	$contact='client';
   	$tipo=[1,3];
 	}    
	$posprovedor = strpos($url, 'proveedores');
    if ($posprovedor !== false) {
   	$contact='provider';
    $tipo=[2,3];
	}
	$clientes=DB::table('app_contactos')->where('id_empresa',Auth::user()->id_empresa)->whereIn('perfil',$tipo)->select('nombre','nit','telefono','nota','id_contacto')->get();
    return View::make("contactos.index")->with(array('clientes'=>$clientes,'contact'=>$contact));
    }

    public function nuevo()
    {
    $var=1;
   	$url= $_SERVER["REQUEST_URI"];
    $pos = strpos($url, 'proveedor');
    if ($pos !== false) {
 	$var=2;
	} 
    return View::make("contactos.nuevo")->with(array('var' => $var ));
    }
    public function crear(Request $request)
    {
   	$request['credito']=str_replace('.', '', $request->credito);
   	$this->validate($request, [
        'nombre' => 'required',
        'descuento' =>'numeric|max:100',
        'credito' => 'numeric',
    ]);
	
	$id=DB::table('app_contactos')->where('id_empresa', Auth::user()->id_empresa)->max('id_contacto') + 1;
    DB::table('app_contactos')->insert(
    ['id_contacto'=>$id,'id_empresa' => Auth::user()->id_empresa, 'nombre' => $request->nombre,'perfil' => $request->perfil, 'nit' => $request->nit,'direccion' => $request->direccion, 'ciudad'=> $request->ciudad,'telefono'=> $request->telefono_1,'telefono_2' => $request->telefono_2,'fax'=> $request->fax,'celular'=> $request->celular,'correo'=> $request->mail,'nota'=> $request->nota,'descuento'=> $request->descuento,'credito'=> $request->credito,'termino'=> $request->termino_de_pago]
);
 if ($request->has('crearotro')) {
 	return back();
 }

 return redirect('contacto/perfil'.'/'.$id);

    }
    public function perfil($id)
    {
	
	$nombre=DB::table('app_contactos')->where('id_empresa', Auth::user()->id_empresa)->where('id_contacto',$id)->value('nombre');
	if (empty($nombre)) {
		redirect('contactos');
	}
	$clientes=DB::table('app_contactos')->where('id_empresa',Auth::user()->id_empresa)->where('id_contacto',$id)->get();
    return View::make("contactos.perfil")->with(array('clientes'=>$clientes,'id'=>$id,'nombre'=>$nombre));
    }
        public function editar($id)
    {
	
	$nombre=DB::table('app_contactos')->where('id_empresa', Auth::user()->id_empresa)->where('id_contacto',$id)->value('nombre');
	if (empty($nombre)) {
	return redirect('contactos');
	}
	$clientes=DB::table('app_contactos')->where('id_empresa',Auth::user()->id_empresa)->where('id_contacto',$id)->get();
    return View::make("contactos.editar")->with(array('clientes'=>$clientes,'id'=>$id,'nombre'=>$nombre));
    }
     public function actualizar(Request $request, $id)
    {

   	$request['credito']=str_replace('.', '', $request->credito);
   	
   	$this->validate($request, [
        'nombre' => 'required',
        'descuento' =>'numeric|max:100',
        'credito' => 'numeric',
    ]);
	$nombre=DB::table('app_contactos')->where('id_empresa', Auth::user()->id_empresa)->where('id_contacto',$id)->value('nombre');
	if (empty($nombre)) {
	return redirect('contactos');
	}
    
    DB::table('app_contactos')->where('id_empresa',Auth::user()->id_empresa)->where('id_contacto',$id)->update(
    ['nombre' => $request->nombre,'perfil' => $request->perfil, 'nit' => $request->nit,'direccion' => $request->direccion, 'ciudad'=> $request->ciudad,'telefono'=> $request->telefono_1,'telefono_2' => $request->telefono_2,'fax'=> $request->fax,'celular'=> $request->celular,'correo'=> $request->mail,'nota'=> $request->nota,'descuento'=> $request->descuento,'credito'=> $request->credito,'termino'=> $request->termino_de_pago]
);
  return redirect('contacto/perfil'.'/'.$id);	
	}	

}
