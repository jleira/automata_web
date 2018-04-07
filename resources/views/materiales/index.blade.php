@extends('layouts.app')

@section('header')
<link rel="stylesheet" href="{{ asset('public/plugins/datatables/dataTables.bootstrap.css')}}"/>
@endsection

@section('htmlheader_title')
{{ trans('a.material') }}s
@endsection


@section('main-content')


<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-primary">
		<div class="panel-body">
	<a href="{{url('material/nuevo')}}" class="btn btn-primary"><i class="fa fa-plus"></i> {{trans('a.nuevo')}} {{trans('a.material')}}</a>			
		</div>
		</div>

		<div class="panel panel-primary">
			<!-- /.box-header -->
			<div class="panel-body">
				<table id="tabla" class="table table-bordered table-striped">
					<thead>
						<tr>
							<th>{{trans('a.nombre')}}</th>
							<th>{{trans('a.referencia')}}</th>
							<th>{{trans('a.precio')}} </th>
							<th>{{trans('a.categoria')}}</th>
							<th>{{trans('a.accion')}}</th>
						</tr>
					</thead>
					<tbody>
						@foreach ($items as $material)
						<tr>
							<td>{{$material->nombre}}</td>
							<td>{{$material->referencia}}</td>
							<td>{{$material->precio}}</td>
							<td>{{categorianombre($material->id_categoria)}}</td>
							<td style="text-align: center;" >
								<a style="color: cyan" href="{{url('material'.'/'.$material->id_material)}}"><i class='fa fa-eye' style="margin: 0% 5%;"></i></a>
								<a style="color: green" href="{{url('material/perfil'.'/'.$material->id_material.'/editar')}}"><i class='fa fa-edit' style="margin: 0% 5%;"></i></a>	
								<a style="color: red" href="{{url('editarmaterial/'.$material->id_material)}}"><i class='fa fa-trash' style="margin: 0% 5%;"></i></a>
							</td>
						</tr>

						@endforeach

					</tbody>

				</table>
			</div>
		</div>
	</div>
</div>


@endsection

@section('script')

<script src="{{ url('public/plugins/datatables/jquery.dataTables.min.js')}}"></script>
<script src="{{ url('public/plugins/datatables/dataTables.bootstrap.min.js')}}"></script>
<script type="text/javascript">

{{datatables('#tabla',trans('a.material'))}}

</script>

@endsection