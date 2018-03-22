@extends('layouts.app')


@section('htmlheader_title')
{{$nombre}}
@endsection

@section('main-content')


<div class="row">
	<div class="col-lg-12">

		<div class="panel panel-primary">
		<div class="panel-body">
	<a href="{{url('bodega/perfil'.'/'.$id.'/editar')}}" class="btn btn-primary"><i class="fa fa-edit"></i> {{trans('adminlte_lang::message.edit')}}</a>

	<a href="{{url('bodega/perfil'.'/'.$id.'/editar')}}" class="btn btn-primary"><i class="fa fa-edit"></i> {{trans('adminlte_lang::message.edit')}}</a>

	<a href="{{url('bodega/perfil'.'/'.$id.'/editar')}}" class="btn btn-primary"><i class="fa fa-edit"></i> {{trans('adminlte_lang::message.edit')}}</a>

	<a href="{{url('bodega/perfil'.'/'.$id.'/editar')}}" class="btn btn-primary"><i class="fa fa-edit"></i> {{trans('adminlte_lang::message.edit')}}</a>

	<a href="{{url('bodega/perfil'.'/'.$id.'/editar')}}" class="btn btn-primary"><i class="fa fa-edit"></i> {{trans('adminlte_lang::message.edit')}}</a>				
		</div>
		</div>
		</div>
	<div class="col-lg-6">

		<div class="panel panel-primary">
			<!-- /.box-header -->
			<div class="panel-body">
				<table id="tabla" class="table table-bordered table-striped">
					<tbody>
						@foreach ($bodegas as $bodega)
						<tr>
							<td>id</td>
							<td>{{$bodega->id_bodega}}</td>
						</tr>
						<tr>
							<td>{{ trans('adminlte_lang::message.name') }}</td>
							<td>{{$bodega->nombre}}</td>
						</tr>
						<tr>
							<td>{{ trans('adminlte_lang::message.city') }}</td>
							<td>{{$bodega->ciudad}}</td>
						</tr>
						<tr>
							<td>{{ trans('adminlte_lang::message.address') }}</td>
							<td>{{$bodega->direccion}}</td>
						</tr>
						<tr>
							<td>{{ trans('adminlte_lang::message.phone') }}</td>
							<td>{{$bodega->telefono}}</td>
						</tr>
						<tr>
							<td>{{ trans('adminlte_lang::message.note') }}</td>
							<td><p>{{$bodega->nota}}</p></td>
						</tr>
						@endforeach

					</tbody>

				</table>
			</div>
		</div>
	</div>
</div>


@endsection

