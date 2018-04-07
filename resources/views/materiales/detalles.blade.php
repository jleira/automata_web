@extends('layouts.app')


@section('htmlheader_title')
detalles de {{$items->nombre}}
@endsection

@section('main-content')


<div class="row">
	<div class="col-lg-6">
		<div class="panel panel-primary">
			<!-- /.box-header -->
			<div class="panel-body">
			<h3>Datos de la materia prima</h3>
				<table id="tabla" class="table table-bordered table-striped">
					<tbody>

						<tr>
							<td>id</td>
							<td>{{$items->id_material}}</td>
						</tr>
 						<tr>
							<td>{{ trans('a.nombre') }}</td>
							<td>{{$items->nombre}}</td>
						</tr>
						<tr>
							<td>{{ trans('a.referencia') }}</td>
							<td>{{$items->referencia}}</td>
						</tr>
						<tr>
							<td>{{ trans('a.nombre') }}</td>
							<td>{{categorianombre($items->id_categoria)}}</td>
						</tr>

						<tr>
							<td>{{ trans('a.descripcion') }}</td>
							<td>{{$items->descripcion}}</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<div class="col-lg-6">
		<div class="panel panel-primary">
			<!-- /.box-header -->

			<div class="panel-body">
						<h3 class="panel-tittle">Inventario</h3>
						@if($items->inventariable>0)
						<table id="tabla" class="table table-bordered table-striped">
					<tbody>

						<tr>
							<td>id</td>
							<td>{{$items->id_material}}</td>
						</tr>
 						<tr>
							<td>{{ trans('a.nombre') }}</td>
							<td>{{$items->nombre}}</td>
						</tr>
						<tr>
							<td>{{ trans('a.referencia') }}</td>
							<td>{{$items->referencia}}</td>
						</tr>
						<tr>
							<td>{{ trans('a.nombre') }}</td>
							<td>{{categorianombre($items->id_categoria)}}</td>
						</tr>

						<tr>
							<td>{{ trans('a.descripcion') }}</td>
							<td>{{$items->descripcion}}</td>
						</tr>
					</tbody>
				</table>

						@else
						No aplica
						@endif
			</div>
		</div>
	</div>

</div>


@endsection

