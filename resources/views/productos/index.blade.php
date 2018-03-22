@extends('layouts.app')

@section('header')
<link rel="stylesheet" href="{{ asset('public/plugins/datatables/dataTables.bootstrap.css')}}"/>
@endsection

@section('htmlheader_title')
{{ trans('adminlte_lang::message.product') }}s
@endsection


@section('main-content')


<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-primary">
		<div class="panel-body">
	<a href="{{url('producto/nuevo')}}" class="btn btn-primary"><i class="fa fa-plus"></i> {{trans('adminlte_lang::message.new')}} {{trans('adminlte_lang::message.product')}}</a>			
		</div>
		</div>

		<div class="panel panel-primary">
			<!-- /.box-header -->
			<div class="panel-body">
				<table id="tabla" class="table table-bordered table-striped">
					<thead>
						<tr>
							<th>{{trans('adminlte_lang::message.name')}}</th>
							<th>{{trans('adminlte_lang::message.reference')}}</th>
							<th>{{trans('adminlte_lang::message.price')}} </th>
							<th>{{trans('adminlte_lang::message.description')}}</th>
							<th>{{trans('adminlte_lang::message.action')}}</th>
						</tr>
					</thead>
					<tbody>
						@foreach ($productos as $producto)
						<tr>
							<td>{{$producto->nombre}}</td>
							<td>{{$producto->referencia}}</td>
							<td>{{$producto->precio}}</td>
							<td>{{$producto->descripcion}}</td>
							<td style="text-align: center;" >
								<a style="color: cyan" href="{{url('producto/perfil'.'/'.$producto->id_producto)}}"><i class='fa fa-eye' style="margin: 0% 5%;"></i></a>
								<a style="color: green" href="{{url('producto/perfil'.'/'.$producto->id_producto.'/editar')}}"><i class='fa fa-edit' style="margin: 0% 5%;"></i></a>	
								<a style="color: red" href="{{url('editarproducto/'.$producto->id_producto)}}"><i class='fa fa-trash' style="margin: 0% 5%;"></i></a>
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

{{datatables('#tabla',trans('adminlte_lang::message.product').'s')}}

</script>

@endsection