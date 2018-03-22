@extends('layouts.app')

@section('htmlheader_title')
{{ trans('adminlte_lang::message.new') }} {{ trans('adminlte_lang::message.product') }}
@endsection

@section('header')
<link rel="stylesheet" type="text/css" href="{{ asset('public/css/fileinput.min.css')}}"/>
<link rel="stylesheet" type="text/css" href="{{ asset('public/css/fileinput-rtl.min.css')}}"/>
@endsection

@section('main-content')

<div class="row">

	<div class="col-lg-12">
		<div class="panel panel-primary">
			<form role="form" class="form-horizontal" enctype="multipart/form-data" method="POST" action="{{ url('productos/nuevo/registrar') }}">
				{{ csrf_field() }}
				<div class="panel-body">

					<div class="col-lg-6">

						<div class="form-group">
							<label class="control-label col-sm-2">{{ trans('adminlte_lang::message.name') }}*</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" value="{{ old('nombre')}}" name="nombre">

							</div>
							@if ($errors->has('nombre') )
							<p style="color:red;margin:0px">{{ $errors->first('nombre') }}</p>
							@endif
						</div>
						<div class="form-group">
							<label class="control-label col-sm-2">{{trans('adminlte_lang::message.reference')}}</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" value="{{ old('referencia')}}" name="referencia">

							</div>
						</div>

						<div class="form-group">
							<label class="control-label col-sm-2">{{trans('adminlte_lang::message.category')}}</label>
							<div class="col-sm-10">
								<select  class="form-control" value="{{ old('categoria')}}" name="categoria">
									<option value="1">Sin categoria</option>
								</select>	
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2">{{ trans('adminlte_lang::message.archive')}}s</label>
							<div class="col-lg-12">
								<input id="archivo" name="archivo" type="file" class="file" multiple data-show-upload="false" data-show-caption="true">
							</div>
						</div>
					</div>

					<div class="col-lg-6">
						<div class="form-group">
							<label class="control-label col-sm-3">{{ trans('adminlte_lang::message.sale_price')}}* </label>
							<div class="col-sm-9">
								<div class="input-group">
									<div class="input-group-addon">
										<i class="fa fa-usd"></i>
									</div>
									<input type="text" onkeyup="format(this)" onchange="format(this)" class="form-control" value="{{old('precio') }}" name="precio">
								</div>
							</div>
							@if ($errors->has('precio') )
							<p style="color:red;margin:0px">{{ $errors->first('precio') }}</p>
							@endif					
						</div>


						<div class="form-group">
							<label class="col-sm-12">{{ trans('adminlte_lang::message.tax')}}* </label>					
							<div class="col-sm-6"><input type="text" value="Ninguno" class="form-control" name="impuesto"></div>
							<div class="col-sm-6">
								<div class="input-group">
									<div class="input-group-addon">
										%
									</div>
									<input type="number" value="0" class="form-control" maxlength="2" name="impuesto">
								</div>
							</div>
							@if ($errors->has('impuesto') )
							<p style="color:red;margin:0px">{{ $errors->first('impuesto') }}</p>
							@endif					
						</div>

						<div class="form-group">
							<label class="control-label col-sm-2">{{ trans('adminlte_lang::message.description')}}</label>
							<div class="col-sm-10">
								<textarea class="form-control" rows="3" name="nota">{{ old('nota')}}</textarea>
							</div>

							@if ($errors->has('nota') )
							<p style="color:red;margin:0px">{{ $errors->first('nota') }}</p>
							@endif
						</div>
						<div class="form-group">
							<div class="checkbox">
								<label><input type="checkbox" class="checkbox icheck" value="">{{ trans('adminlte_lang::message.inventory')}}</label>
							</div>
							
						</div>
					</div>
					<div class="col-lg-12">
						<div class="panel panel-success">
							<div class="panel-body">
							<div class="col-sm-6">
								<div class="form-group">
								<label class="col-sm-4 control-label">Unidad de medida</label>
								<div class="col-sm-8">
									<select class="form-control">
    <option value="volvo">No aplica</option>
  <optgroup label="Unidad">
    <option value="volvo">Unidad</option>
    <option value="saab">Servicio</option>
    <option value="saab">Pieza</option>
  </optgroup>
  <optgroup label="Longitud">
    <option value="mercedes">Cemtimetro (cm)</option>
    <option value="audi">Metro(m)</option>
    <option value="audi">Pulgada</option>
  </optgroup>
  <optgroup label="Area">
    <option value="mercedes">Centímetro cuadrado (cm2)</option>
    <option value="audi">Metro cuadrado (m2)</option>
    <option value="audi">Pulgada cuadrado</option>
  </optgroup>
  <optgroup label="Volumen">
    <option value="mercedes">Mililitro (mL)</option>
    <option value="audi">Litro (L)</option>
    <option value="audi">Galón</option>
  </optgroup>
  <optgroup label="Peso">
    <option value="mercedes">Gramo (g)</option>
    <option value="audi">Kilogramo (Kg)</option>
    <option value="audi">Tonelada</option>
  </optgroup>
</select>

		</div>	
	</div>
</div>

<div class="col-sm-6">
	<div class="form-group">
		<label class="col-sm-4 control-label">Costo Unidad</label>
			<div class="col-sm-8">
				<div class="input-group">
		 			<div class="input-group-addon">
						<i class="fa fa-usd"></i>
					</div>
				<input type="text" onkeyup="format(this)" onchange="format(this)" class="form-control" value="{{old('valor_unidad') }}" name="valor_unidad">
				</div>
			</div>	
	</div>
	@if ($errors->has('valor_unidad') )
		<p style="color:red;margin:0px">{{ $errors->first('valor_unidad') }}</p>
	@endif

</div>

	<div id="input1" class="clonedInput" >
	
		<div class="col-sm-6">
			<div class="form-group">
				<label class="col-sm-4 control-label">Bodega</label>
					<div class="col-sm-8">
						<select class="form-control" name="producto[]" id="produc1" >
							<option>1</option>
							<option>1</option>
							<option>1</option>
							<option>1</option>							
						</select>
					</div>
			</div>
		</div>

	
		<div class="col-sm-6">
			<div class="form-group">
				<label class="col-sm-4 control-label">Cantidad inicial</label>
					<div class="col-sm-8">
						<input type="number" name="cantidad" class="form-control">
					</div>
			</div>
		</div>
	

	</div>
						@if ($errors->has('cantidad') )
						<p style="color:red;margin:0px">{{ $errors->first('cantidad') }}</p>
						@endif
						<div style="padding-top:4px" >
							<a  id="btnAdd" class="btn btn-primary btn-xs" value="+">+</a>
							<a  id="btnless" class="btn btn-danger btn-xs" value="-" disabled>-</a>
						</div>




							</div>
						</div>
					</div>				


				</form>
			</div>
		</div>
	</div>
	<div class="col-lg-12">
		<div class="btn-group" style="width: 100%">
			<a href="{{url('contactos')}}" class="btn btn-link" style="color: red;width: 24%">{{ trans('adminlte_lang::message.cancel')}}</a>	
			<button type="submit" class="btn btn-info" name="crearotro" value="1" style="width: 52%">{{ trans('adminlte_lang::message.save')}} {{ trans('adminlte_lang::message.and')}} {{ trans('adminlte_lang::message.create_other')}}</button>	
			<button type="submit" class="btn btn-success" style="width: 24%">{{ trans('adminlte_lang::message.save')}}</button>	
		</div>
	</div>
	


</div>


@endsection

@section('script')

<script src="{{url('public/js/plugins/piexif.min.js')}}" type="text/javascript"></script>
<script src="{{url('public/js/plugins/sortable.min.js')}}" type="text/javascript"></script>
<script src="{{url('public/js/plugins/purify.min.js')}}" type="text/javascript"></script>
<script src="{{url('public/js/fileinput.min.js')}}"></script>
<script src="{{url('public/js/locales/fa.js')}}"></script>
<script src="{{url('public/js/locales/es.js')}}"></script>








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

$('#archivo').fileinput({
	language: 'es',
	showUpload: false,
	previewFileType:'any'
});
</script>
@endsection