@extends('layouts.app')

@section('htmlheader_title')
{{ trans('adminlte_lang::message.new') }} {{ trans('adminlte_lang::message.cellar') }}
@endsection


@section('main-content')

<div class="row">
	@if(Session::has('flash_message'))
	<div class="alert alert-success alert-dismissable fade in">
		<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
		<strong>Grandioso!</strong> {{Session::get('flash_message')}}
	</div>
	@endif
	<div class="col-md-4">
		<div class="panel box-primary">
			<!-- /.box-header -->
			<!-- form start -->
			<form role="form"  enctype="multipart/form-data" method="POST" action="{{ url('bodegas/nuevo/registrar	') }}">
				{{ csrf_field() }}
				<div class="box-body">
					<div class="form-group">
						<label for="exampleInput">{{ trans('adminlte_lang::message.name') }}*</label>
						<input type="text" class="form-control" value="{{ old('nombre')}}" name="nombre">
						@if ($errors->has('nombre') )
						<p style="color:red;margin:0px">{{ $errors->first('nombre') }}</p>
						@endif
					</div>
					<div class="form-group">
						<label for="exampleInput">{{ trans('adminlte_lang::message.city') }}</label>
						<input type="text" class="form-control" value="{{ old('ciudad')}}" name="ciudad">
						@if ($errors->has('ciudad') )
						<p style="color:red;margin:0px">{{ $errors->first('ciudad') }}</p>
						@endif
					</div>

					<div class="form-group">
						<label for="exampleInput">{{ trans('adminlte_lang::message.address') }}</label>
						<input type="text" class="form-control" name="direccion">
						@if ($errors->has('direccion') )
						<p style="color:red;margin:0px">{{ $errors->first('direccion') }}</p>
						@endif
					</div>

					<div class="form-group">
						<label for="exampleInput">{{ trans('adminlte_lang::message.phone') }}</label>
						<input type="text" class="form-control" name="telefono" value="{{ old('telefono')}}">
						@if ($errors->has('telefono') )
						<p style="color:red;margin:0px">{{ $errors->first('telefono') }}</p>
						@endif
					</div>
					<div class="form-group">
						<label for="exampleInput">{{ trans('adminlte_lang::message.note') }}</label>
						<textarea class="form-control" name="nota">{{ old('nota')}}</textarea> 
						@if ($errors->has('nota') )
						<p style="color:red;margin:0px">{{ $errors->first('nota') }}</p>
						@endif
					</div>
					<div class="box-footer" >
					<div class="btn-group" style="width: 100%">
							<a href="{{url('bodegas')}}" class="btn btn-link" style="color: red;width: 24%">{{ trans('adminlte_lang::message.cancel')}}</a>	
							<button type="submit" class="btn btn-info" name="crearotro" value="1" style="width: 52%">{{ trans('adminlte_lang::message.save')}} {{ trans('adminlte_lang::message.and')}} {{ trans('adminlte_lang::message.create_other')}}</button>	
							<button type="submit" class="btn btn-success" style="width: 24%">{{ trans('adminlte_lang::message.save')}}</button>	
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>


</div>

@endsection
