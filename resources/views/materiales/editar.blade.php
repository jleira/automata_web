@extends('layouts.app') @section('htmlheader_title') {{ trans('adminlte_lang::message.new') }} {{ trans('a.material') }}
@endsection @section('header')
<link rel="stylesheet" type="text/css" href="{{ asset('public/css/fileinput.min.css')}}" />
<link rel="stylesheet" type="text/css" href="{{ asset('public/css/fileinput-rtl.min.css')}}" /> @endsection @section('main-content')

<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-primary">
			<form role="form" class="form-horizontal" enctype="multipart/form-data" method="POST" action="{{ url('material/editar/'.$items->id_material) }}">
				{{ csrf_field() }}
				<div class="panel-body">
					<div class="col-lg-6">
						<div class="form-group">
							<label class="control-label col-sm-2">{{ trans('a.nombre') }}*</label>
							<div class="col-sm-10">
							@if(!empty(old()))
							<input type="text" class="form-control" value="{{old('nombre')}}" name="nombre">
							@else
							<input type="text" class="form-control" value="{{ $items->nombre}}" name="nombre">
							@endif
							</div>
							@if ($errors->has('nombre') )
							<p style="color:red;margin:0px">{{ $errors->first('nombre') }}</p>
							@endif
						</div>
						<div class="form-group">
							<label class="control-label col-sm-2">{{trans('a.referencia')}}</label>
							<div class="col-sm-10">
							@if(old('referencia'))
								<input type="text" class="form-control" value="{{old('referencia')}}" name="referencia">
							@else
								<input type="text" class="form-control" value="{{ $items->referencia}}" name="referencia">
							@endif
							</div>

						</div>
						<div class="form-group">
							<label class="control-label col-sm-2">{{trans('a.categoria')}}</label>
							<div class="col-sm-10">
								<select class="form-control" value="{{old('categoria')}}" name="categoria">									
								@if(!empty(old()))
								<option value="{{'0'}}">Sin categoria</option>
									@foreach ($categorias as $categoria)
									@if(old('categoria') == $categoria->id_categoria)
									<option value="{{$categoria->id_categoria}}" selected>{{$categoria->nombre}} - {{$categoria->referencia}}</option>
									@else
									<option value="{{$categoria->id_categoria}}" >{{$categoria->nombre}} - {{$categoria->referencia}}</option>
									@endif
									@endforeach 
								@else
									@if($items->id_categoria>0)
										<option value="{{'0'}}">Sin categoria</option>
										@foreach ($categorias as $categoria) 
											@if($categoria->id_categoria==$items->id_categoria)
											<option value="{{$categoria->id_categoria}}" selected>{{$categoria->nombre}} - {{$categoria->referencia}}</option>
											@else
											<option value="{{$categoria->id_categoria}}">{{$categoria->nombre}} - {{$categoria->referencia}}</option>
											@endif 
										@endforeach 
									@else
										<option value="{{'0'}}">Sin categoria</option>
										@foreach ($categorias as $categoria)
										<option value="{{$categoria->id_categoria}}">{{$categoria->nombre}} - {{$categoria->referencia}}</option>
										@endforeach 
									@endif
								@endif
								</select>
							</div>
						</div>
						<div class="form-group">
							<div class="checkbox">
								@if(old('inventariable'))
								@if(truefalse(old('inventariable')))
								<label>
									<input type="checkbox" name="inventariable" class="checkbox icheck" value="1" checked>{{ trans('a.inventariable')}}
								</label>
								@else
								<label>
									<input type="checkbox" name="inventariable" class="checkbox icheck" value="1">{{ trans('a.inventariable')}}
								</label>
								@endif
								@else
								@if(truefalse($items->inventariable))
								<label>
									<input type="checkbox" name="inventariable" class="checkbox icheck" value="1" checked>{{ trans('a.inventariable')}}
								</label>
								@else
								<label>
									<input type="checkbox" name="inventariable" class="checkbox icheck" value="1">{{ trans('a.inventariable')}}
								</label>
								@endif
								@endif

							</div>
						</div>

						<!-- <div class="form-group">
							<label class="col-sm-2">{{ trans('a.archivo')}}s</label>
							<div class="col-lg-12">
								<input id="archivo" name="archivo" type="file" class="file" multiple data-show-upload="false" data-show-caption="true">
							</div>
						</div> -->
					</div>

					<div class="col-lg-6">
						<div class="form-group">
							<label class="control-label col-sm-3">{{ trans('a.preciodecompra')}}* </label>
							<div class="col-sm-9">
								<div class="input-group">
									<div class="input-group-addon">
										<i class="fa fa-usd"></i>
									</div>
									@if(old('precio'))
									<input type="text" onkeyup="format(this)" onchange="format(this)" class="form-control" value="{{old('precio') }}" name="precio">
									@else
									<input type="text" onkeyup="format(this)" onchange="format(this)" class="form-control" value="{{$items->precio }}" name="precio">
									@endif
								</div>
							</div>
							<p style="color:red;margin:0px">Sera su valor en caso de no ser inventariable</p>

							@if ($errors->has('precio') )
							<p style="color:red;margin:0px">{{ $errors->first('precio') }}</p>
							@endif
						</div>

						<div class="form-group">
							<label class="control-label col-sm-2">{{ trans('a.descripcion')}}</label>
							<div class="col-sm-10">
								@if(old('descripcion'))
									<textarea class="form-control" rows="3" name="descripcion">{{ old('descripcion')}}</textarea>
								@else
									<textarea class="form-control" rows="3" name="descripcion">{{ $items->descripcion}}</textarea>
								@endif
							</div>

							@if ($errors->has('descripcion') )
							<p style="color:red;margin:0px">{{ $errors->first('descripcion') }}</p>
							@endif
						</div>
					</div>
					<div class="col-lg-12">
						<div class="btn-group" style="width: 100%">
							<a href="{{url('material/'.$items->id_material)}}" class="btn btn-danger" style="width: 48%">{{ trans('a.cancelar')}}</a>
							<button type="submit" class="btn btn-success" style="width: 48%">{{ trans('a.guardar')}}</button>
						</div>
					</div>


			</form>
			</div>
		</div>
	</div>



</div>


@endsection @section('script')

<script src="{{url('public/js/plugins/piexif.min.js')}}" type="text/javascript"></script>
<script src="{{url('public/js/plugins/sortable.min.js')}}" type="text/javascript"></script>
<script src="{{url('public/js/plugins/purify.min.js')}}" type="text/javascript"></script>
<script src="{{url('public/js/fileinput.min.js')}}"></script>
<script src="{{url('public/js/locales/fa.js')}}"></script>
<script src="{{url('public/js/locales/es.js')}}"></script>








<script type="text/javascript">
	function format(input) {
		var num = input.value.replace(/\./g, '');
		if (!isNaN(num)) {
			num = num.toString().split('').reverse().join('').replace(/(?=\d*\.?)(\d{3})/g, '$1.');
			num = num.split('').reverse().join('').replace(/^[\.]/, '');
			input.value = num;
		}
		else {
			alert('Solo se permiten numeros');
			input.value = input.value.replace(/[^\d\.]*/g, '');
		}
	}

	$('#archivo').fileinput({
		language: 'es',
		showUpload: false,
		previewFileType: 'any'
	});
</script> @endsection