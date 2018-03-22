<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Requests;
use Illuminate\Http\Response;

use DB;

class MovilController extends Controller
{
    public function login(Request $request)
    {
/*         if($request->has('username') && $request->has('password') && $request->has('team')){
            return New Response($request->all());
        }else{
            return ($request->all());
        } */
      $items=DB::table('users')->get();
    foreach($items as $item){
        $item->perfiles=explode(',',$item->perfiles);
    }
    return response($items);
    
    }
    public function empresasactivas(){
        return(bcrypt('beto1337'));
/*         if(count($items)>0){
//            return Response($items,200);
            return New Response($items,200);
        }else{
            return response('No se encontro empresas registradas, contacte con su adminitrador',500);
        } */
    }
}
 ?>