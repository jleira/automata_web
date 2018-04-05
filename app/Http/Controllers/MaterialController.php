<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Http\Requests;
use DB;
use View;
use Auth;

class MaterialController extends Controller
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
    $items=DB::table('materiales')->where('id_empresa',Auth::user()->id_empresa)->get();
    return View::make("materiales.index")->with(array('items'=>$items));
    }

    public function nuevo()
    {
    if(tienepermisos([6])){
    $categorias=DB::table('categorias')->select('nombre','id_categoria','referencia')->where('id_empresa',Auth::user()->id_empresa)->orderBy('nombre','ASC')->get();
    $mensaje[0]=1;
    $mensaje[1]='probando';
 //   $mensaje[0]=1;

    return View::make("materiales.nuevo")->with(array('categorias'=>$categorias,'mensaje'=>$mensaje));
    }else{
        return view('errors.401');
    }
    }
    public function nuevomaterial(Request $request)
    {
        $request['precio']=intval(str_replace('.','',$request['precio']));
        $this->validate($request, [
            'nombre' => 'required',
            'precio' => 'numeric',
            'categoria'=>'required',
        ]);
        if(!$request->has('descripcion')){
            $request->descripcion="";
           }
           if(!$request->has('referencia')){
            $request->referencia="";
           }
           if(!$request->has('precio')){
            $request->precio=0;
           }
           $idmaterial = DB::table('materiales')->where('id_empresa',Auth::user()->id_empresa)->max('id_material');

/*            DB::table('materiales')->insert(
    [
    'id_empresa' => Auth::user()->id_empresa,
    'id_material' => $idmaterial+1, 
    'nombre' => $request->nombre,
    'referencia' => $request->referencia,
    'descripcion'=> $request->descripcion        
    ]
); */
if($request->has('crearotro')){
    return back()->with(array('mensaje'=>'material creado existosamente'));
}
        return var_dump($request->all());
    }
    public function categorias()
    {
    $items=DB::table('categorias')->where('id_empresa',Auth::user()->id_empresa)->get();
    return View::make("materiales.categorias")->with(array('items'=>$items));
    }

    public function nuevacategoria(Request $request)
    {

    $this->validate($request, [
            'nombre' => 'required',
    ]);
    $validador=DB::table('categorias')->where('id_empresa',Auth::user()->id_empresa)->where('nombre',$request->nombre)->first();
        if(($validador)){
            $this->validate($request, [
                'nombre' => 'required|unique:categorias,nombre',
        ]);
    
       }
       if(!$request->has('descripcion')){
        $request->descripcion="";
       }
       if(!$request->has('referencia')){
        $request->referencia="";
       }
       $categoriaid = DB::table('categorias')->where('id_empresa',Auth::user()->id_empresa)->max('id_categoria');

       DB::table('categorias')->insert(
        [
        'id_empresa' => Auth::user()->id_empresa,
        'id_categoria' => $categoriaid+1, 
        'nombre' => $request->nombre,
        'referencia' => $request->referencia,
        'descripcion'=> $request->descripcion        
        ]
    );
    return back();
    }
    public function editarcategoria(Request $request)
    {
    $this->validate($request, [
            'nombre' => 'required',
            'id' => 'required'
    ]);
    $categoria=DB::table('categorias')->select('id','nombre')->where('id_empresa',Auth::user()->id_empresa)->where('id_categoria',$request->id)->first();
    if($categoria->nombre==$request->nombre){

    }else{
    $validador=DB::table('categorias')->where('id_empresa',Auth::user()->id_empresa)->where('nombre',$request->nombre)->first();
         if(($validador)){
            $this->validate($request, [
                'nombre' => 'required|unique:categorias,nombre',
         ]);
         }    
       }
       if(!$request->has('descripcion')){
        $request->descripcion="";
       }
       if(!$request->has('referencia')){
        $request->referencia="";
       }
       DB::table('categorias')->where('id',$categoria->id)->update(
        [
        'nombre' => $request->nombre,
        'referencia' => $request->referencia,
        'descripcion'=> $request->descripcion        
        ]
    );
    return back();
    }

}
