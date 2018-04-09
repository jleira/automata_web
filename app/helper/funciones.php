<?php

function idioma()
{
$caso=2;
if ($caso==1) {return 'en';}
else {return 'es';}
}

function s()
{
$caso=2;
if ($caso==1) {return 's';}
else {return 'es';}
}
function active($seccion){
  $url= $_SERVER["REQUEST_URI"];
    $pos = strpos($url, $seccion);
    if ($pos !== false) {
      return 'active';
}
}

function lista($lista,$id,$caso){
	$value='nombre_item';
	if ($caso==2) {
	$value='descripcion_item';
	}
return $item=DB::table('app_lista')->where('id_tipo_lista',$lista)->where('id_item',$id)->value($value);
}
function categorianombre($idcategoria)
{
	if($idcategoria==0){
		return trans('a.sincategoria');
	}else{
		return DB::table('categorias')->select('nombre')->
where('id_categoria',$idcategoria)->where('id_empresa', Auth::user()->id_empresa)->value('nombre');
	}

}
function tienepermisos($permisos)
{
	$perfiles=array_map('intval', explode(',', Auth::user()->perfiles));
	foreach ($permisos as $permiso) {
	if(in_array($permiso, $perfiles)){
		return true;
	}	
}
}
function truefalse($value){
	if($value>0){
		return true;
	}else{
		return false;
	}
}