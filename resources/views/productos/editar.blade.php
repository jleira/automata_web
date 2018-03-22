@extends('layouts.app')

@section('htmlheader_title')
{{ trans('adminlte_lang::message.new') }} {{ trans('adminlte_lang::message.contact') }}
@endsection

@section('main-content')

<div class="row">

	<div class="col-lg-12">
		<div class="panel panel-primary">
		@foreach($clientes as $cliente)
			<form role="form" class="form-horizontal" enctype="multipart/form-data" method="POST" action="{{ url('contacto/perfil'.'/'.$id.'/editar') }}">
				{{ csrf_field() }}
				<div class="panel-body">

					<div class="col-lg-6">

					<div class="form-group">
					<label class="control-label col-sm-2">{{ trans('adminlte_lang::message.name') }}</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" value="{{ $cliente->nombre}}" name="nombre">
						
					</div>
					@if ($errors->has('nombre') )
						<p style="color:red;margin:0px">{{ $errors->first('nombre') }}</p>
						@endif
					</div>
					<div class="form-group">
					<label class="control-label col-sm-2">Nit</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" value="{{ $cliente->nit}}" name="nit">
						
					</div>
					@if ($errors->has('nit') )
						<p style="color:red;margin:0px">{{ $errors->first('nit') }}</p>
						@endif
					</div>

					<div class="form-group">
					<label class="control-label col-sm-2">{{ trans('adminlte_lang::message.address') }}</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" value="{{ $cliente->direccion}}" name="direccion">
						
					</div>
					@if ($errors->has('direccion') )
						<p style="color:red;margin:0px">{{ $errors->first('direccion') }}</p>
						@endif
					</div>

					<div class="form-group">
					<label class="control-label col-sm-2">{{ trans('adminlte_lang::message.city') }}</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" value="{{ $cliente->ciudad}}" name="ciudad">
						
					</div>
					@if ($errors->has('ciudad') )
						<p style="color:red;margin:0px">{{ $errors->first('ciudad') }}</p>
						@endif
					</div>

					<div class="form-group">
					<label class="control-label col-sm-3">{{ trans('adminlte_lang::message.phone') }} 1</label>
					<div class="col-sm-9">
						<input type="text" class="form-control" value="{{ $cliente->telefono}}" name="telefono_1">
						
					</div>
					@if ($errors->has('telefono_1') )
						<p style="color:red;margin:0px">{{ $errors->first('telefono_1') }}</p>
						@endif
					</div>

					<div class="form-group">
					<label class="control-label col-sm-3">{{ trans('adminlte_lang::message.phone')}} 2</label>
					<div class="col-sm-9">
						<input type="text" class="form-control" value="{{ $cliente->telefono_2}}" name="telefono_2">
						
					</div>
					@if ($errors->has('telefono_2') )
						<p style="color:red;margin:0px">{{ $errors->first('telefono_2') }}</p>
						@endif
					</div>

					<div class="form-group">
					<label class="control-label col-sm-2">Fax</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" value="{{ $cliente->fax}}" name="fax">
						
					</div>
					@if ($errors->has('fax') )
						<p style="color:red;margin:0px">{{ $errors->first('fax') }}</p>
						@endif
					</div>

					<div class="form-group">
					<label class="control-label col-sm-2">{{ trans('adminlte_lang::message.cell')}}</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" value="{{ $cliente->celular}}" name="celular">
						
					</div>
					@if ($errors->has('celular') )
						<p style="color:red;margin:0px">{{ $errors->first('celular') }}</p>
						@endif
					</div>
			</div>

					<div class="col-lg-6">


					<div class="form-group">
					<label class="control-label col-sm-5">{{ trans('adminlte_lang::message.email')}} </label>
					<div class="col-sm-7">
						<input type="email" class="form-control" value="{{ $cliente->correo}}" name="mail">
					</div>
						@if ($errors->has('mail') )
						<p style="color:red;margin:0px">{{ $errors->first('mail') }}</p>
						@endif					
					</div>



					<div class="form-group">
					<label class="control-label col-sm-2">{{ trans('adminlte_lang::message.note')}}</label>
					<div class="col-sm-10">
						<textarea class="form-control" rows="3" name="nota">{{ $cliente->nota}}</textarea>
					</div>

						@if ($errors->has('nota') )
						<p style="color:red;margin:0px">{{ $errors->first('nota') }}</p>
						@endif
					</div>


					<div class="form-group">
					<label class="control-label col-sm-2">{{ trans('adminlte_lang::message.discount')}}</label>
					<div class="col-sm-10">
					<div class="input-group">
					<div class="input-group-addon">
					%
				 </div>
				 <input type="number" class="form-control" maxlength="2" value="{{$cliente->descuento }}" name="descuento">
					</div>
					</div>

						@if ($errors->has('descuento') )
						<p style="color:red;margin:0px">{{ $errors->first('descuento') }}</p>
						@endif					
					</div>


					<div class="form-group">
					<label class="control-label col-sm-2">{{ trans('adminlte_lang::message.credit')}} </label>
					<div class="col-sm-10">
					<div class="input-group">
					<div class="input-group-addon">
					 <i class="fa fa-usd"></i>
				 </div>
				 <input type="text" onkeyup="format(this)" onchange="format(this)" class="form-control" value="{{$cliente->credito }}" name="credito">
					</div>
					</div>

						@if ($errors->has('credito') )
						<p style="color:red;margin:0px">{{ $errors->first('credito') }}</p>
						@endif					
					</div>

					<div class="form-group">
					<label class="control-label col-sm-5">{{ trans('adminlte_lang::message.pay_term')}} ({{ trans('adminlte_lang::message.day')}}s)</label>
					<div class="col-sm-7">
						<input type="number" class="form-control" value="{{ $cliente->termino}}" name="termino_de_pago">
						
					</div>
					@if ($errors->has('termino_de_pago') )
						<p style="color:red;margin:0px">{{ $errors->first('termino_de_pago') }}</p>
						@endif
					</div>

					<div class="form-group">
					<label class="control-label col-sm-5">{{ trans('adminlte_lang::message.profile')}} {{ trans('adminlte_lang::message.of')}} {{ trans('adminlte_lang::message.contact')}}</label>
					<div class="col-sm-7">
						<select class="form-control" name="perfil">

							<option value="1">{{ trans('adminlte_lang::message.client')}}</option>
						@if($cliente->perfil == 2)
						<option value="2" selected>{{ trans('adminlte_lang::message.provider')}}</option>
						<option value="3">{{ trans('adminlte_lang::message.client')}} {{ trans('adminlte_lang::message.and')}} {{ trans('adminlte_lang::message.provider')}}</option>
						@elseif($cliente->perfil==3)
						<option value="2">{{ trans('adminlte_lang::message.provider')}}</option>
						<option value="3" selected>{{ trans('adminlte_lang::message.client')}} {{ trans('adminlte_lang::message.and')}} {{ trans('adminlte_lang::message.provider')}}</option>
						@else
						<option value="2">{{ trans('adminlte_lang::message.provider')}}</option>
						<option value="3">{{ trans('adminlte_lang::message.client')}} {{ trans('adminlte_lang::message.and')}} {{ trans('adminlte_lang::message.provider')}}</option>
						@endif
							

						</select>
					
						
					</div>
					@if ($errors->has('termino_de_pago') )
						<p style="color:red;margin:0px">{{ $errors->first('termino_de_pago') }}</p>
						@endif
					</div>


					

<div class="btn-group" style="width: 100%">
<a href="{{url('contactos')}}" class="btn btn-link" style="color: red;width: 50%">{{ trans('adminlte_lang::message.cancel')}}</a>	
<button type="submit" class="btn btn-info" name="crearotro" value="1" style="width: 50%">{{ trans('adminlte_lang::message.save')}}  </button>	
</div>


					</div>


				</form>
	@endforeach
			</div>
		</div>
	</div>



</div>


@endsection

@section('script')
<script type="text/javascript">
	function format(input)
{
var num = input.value.replace(/\./g,'');
if(!isNaN(num)){
num = num.toString().split('').reverse().join('').replace(/(?=\d*\.?)(\d{3})/g,'$1.');
num = num.split('').reverse().join('').replace(/^[\.]/,'');
input.value = num;
}
else{ alert('Solo se permiten numeros');
input.value = input.value.replace(/[^\d\.]*/g,'');
}
}
</script>
@endsection