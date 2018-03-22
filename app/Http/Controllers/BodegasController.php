<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Http\Requests;
use DB;
use Auth;
use View;

class BodegasController extends Controller
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
    $bodegas=DB::table('app_bodegas')->where('id_empresa',Auth::user()->id_empresa)->get();
    return View::make("bodegas.index")->with(array('bodegas'=>$bodegas));
  }
   public function nuevo()
   {
   return View::make("bodegas.nuevo");
   }

     public function crear(Request $request)
    {
    $this->validate($request, [
        'nombre' => 'required',
    ]);
  
  $id=DB::table('app_bodegas')->where('id_empresa', Auth::user()->id_empresa)->max('id_bodega') + 1;
    DB::table('app_bodegas')->insert(
    ['id_bodega'=>$id,'id_empresa' => Auth::user()->id_empresa, 'nombre' => $request->nombre,'direccion' => $request->direccion, 'ciudad'=> $request->ciudad,'telefono'=> $request->telefono,'nota'=> $request->nota]
);
 if ($request->has('crearotro')) {
  return back();
 }
 return redirect('bodega/perfil'.'/'.$id);
}  
    public function perfil($id)
    {
  
  $nombre=DB::table('app_bodegas')->where('id_empresa', Auth::user()->id_empresa)->where('id_bodega',$id)->value('nombre');
  if (empty($nombre)) {
    redirect('bodegas');
  }
  $bodegas=DB::table('app_bodegas')->where('id_empresa',Auth::user()->id_empresa)->where('id_bodega',$id)->get();
    return View::make("bodegas.perfil")->with(array('bodegas'=>$bodegas,'id'=>$id,'nombre'=>$nombre));
    }
        public function editar($id)
    {
  
  $nombre=DB::table('app_bodegas')->where('id_empresa', Auth::user()->id_empresa)->where('id_bodega',$id)->value('nombre');
  if (empty($nombre)) {
  return redirect('bodegas');
  }
  $bodegas=DB::table('app_bodegas')->where('id_empresa',Auth::user()->id_empresa)->where('id_bodega',$id)->get();
    return View::make("bodegas.editar")->with(array('bodegas'=>$bodegas,'id'=>$id,'nombre'=>$nombre));
    }
     public function actualizar(Request $request, $id)
    {
    $this->validate($request, [
        'nombre' => 'required',
    ]);
  
 $nombre=DB::table('app_bodegas')->where('id_empresa', Auth::user()->id_empresa)->where('id_bodega',$id)->value('nombre');
  if (empty($nombre)) {
  return redirect('bodegas');
  }

    DB::table('app_bodegas')->where('id_empresa',Auth::user()->id_empresa)->where('id_bodega',$id)->update(
    ['nombre' => $request->nombre,'direccion' => $request->direccion, 'ciudad'=> $request->ciudad,'telefono'=> $request->telefono,'nota'=> $request->nota]
);
 return redirect('bodega/perfil'.'/'.$id);
} 

}

