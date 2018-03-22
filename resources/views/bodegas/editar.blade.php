@extends('layouts.app')

@section('htmlheader_title')
	{{ $nombre }}
@endsection


@section('main-content')

<div class="row">
  @foreach($bodegas as $bodega)
  <div class="col-lg-6">
    <form role="form" enctype="multipart/form-data" method="POST" action="{{ url('bodega/perfil'.'/'.$id.'/editar') }}">
    {{ csrf_field() }}
     <div class="form-group">
            <label for="exampleInput">{{ trans('adminlte_lang::message.name') }}</label>     
       <input class="form-control" type="text" name="nombre" value="{{$bodega->nombre}}">
     </div>
     <div class="form-group">
            <label for="exampleInput">{{ trans('adminlte_lang::message.city') }}</label>
       <input class="form-control" type="text" name="ciudad" value="{{$bodega->ciudad}}">
     </div>
     <div class="form-group">
            <label for="exampleInput">{{ trans('adminlte_lang::message.address') }}</label>
       <input class="form-control" type="text" name="direccion" value="{{$bodega->direccion}}">
     </div>
     <div class="form-group">
            <label for="exampleInput">{{ trans('adminlte_lang::message.phone') }}</label>
       <input class="form-control" type="text" name="telefono" value="{{$bodega->telefono}}">
     </div>
          <div class="form-group">
            <label for="exampleInput">{{ trans('adminlte_lang::message.note') }}</label>
            <textarea class="form-control" name="nota">{{$bodega->nota}}</textarea> 
            @if ($errors->has('nota') )
            <p style="color:red;margin:0px">{{ $errors->first('nota') }}</p>
            @endif
          </div>

     <div class="box-footer" id="registrar">
          <button type="submit" name="button" class="btn btn-primary">{{ trans('adminlte_lang::message.save') }}</button>
          </div>

</form>
  </div>
@endforeach
</div>

<script type="text/javascript">
  
window.onload = function() {

if (window.location.protocol != "https:") {

}else{

  if (navigator.geolocation)
    {    
     navigator.geolocation.getCurrentPosition(MostrarPosition, mostrarerrores);
    }
  else
    {
       alert("Geolocalizacion no soportada por el navegador");
            document.getElementById('registrar').innerHTML='  <button type="submit" class="btn btn-primary">Registrar</button>'; 
    }
}
}

function MostrarPosition(position)
  {
     document.getElementById('posicion').value=position.coords.latitude+",  " + position.coords.longitude; 
     document.getElementById('registrar').innerHTML=' <button type="submit" class="btn btn-primary">Editar</button>'; 

  }
function mostrarerrores(error) {
    switch(error.code) {
        case error.PERMISSION_DENIED:
            alert("Para poder enviar el formulario debe proporcionar su ubicacion");
            break;
        case error.POSITION_UNAVAILABLE:
              
              document.getElementById('registrar').innerHTML='  <button type="submit" class="btn btn-primary">Registrar</button>'; 
            break;
        case error.TIMEOUT:
             
           document.getElementById('registrar').innerHTML=' <button type="submit" class="btn btn-primary">Editar</button>'; 

            break;
        case error.UNKNOWN_ERROR:
             
           document.getElementById('registrar').innerHTML=' <button type="submit" class="btn btn-primary">Editar</button>'; 

            break;
    }
}

  
</script>


@endsection
