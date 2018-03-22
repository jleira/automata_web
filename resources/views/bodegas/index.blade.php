@extends('layouts.app')

@section('header')
<link rel="stylesheet" href="{{ asset('public/plugins/datatables/dataTables.bootstrap.css')}}"/>
@endsection

@section('htmlheader_title')
{{ trans('adminlte_lang::message.cellar') }}
@endsection

@section('main-content')
<div class="row">
	<div class="col-lg-12">

		<div class="panel panel-primary">
			<div class="panel-body">
				<a href="{{url('bodega/nuevo')}}" class="btn btn-primary"><i class="fa fa-plus"></i> {{trans('adminlte_lang::message.new')}} {{trans('adminlte_lang::message.cellar')}}</a>			
			</div>
		</div>

		<div class="panel panel-primary">

			<div class="panel-body">
				<table id="tabla" class="table table-bordered table-striped">
					<thead>
						<tr>
							<th>Id</th>
							<th>{{ trans('adminlte_lang::message.name') }}</th>
							<th>{{ trans('adminlte_lang::message.city') }}</th>
							<th>{{ trans('adminlte_lang::message.address') }}</th>
							<th>{{ trans('adminlte_lang::message.phone') }}</th>
							<th>{{ trans('adminlte_lang::message.action') }}</th>
						</tr>
					</thead>
					<tbody>
						@foreach ($bodegas as $bodega)
						<tr>
							<td>{{$bodega->id_bodega}}</td>
							<td>{{$bodega->nombre}}</td>
							<td>{{$bodega->ciudad}}</td>
							<td>{{$bodega->direccion}}</td>
							<td>{{recortar($bodega->telefono,20)}}</td>
<td style="text-align: center;" >
								<a style="color: cyan" href="{{url('bodega/perfil'.'/'.$bodega->id_bodega)}}"><i class='fa fa-eye' style="margin: 0% 5%;"></i></a>
								<a style="color: green" href="{{url('bodega/perfil'.'/'.$bodega->id_bodega.'/editar')}}"><i class='fa fa-edit' style="margin: 0% 5%;"></i></a>	
								<a style="color: red" href="{{url('bodega/perfil/'.$bodega->id_bodega)}}"><i class='fa fa-trash' style="margin: 0% 5%;"></i></a>
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

{{datatables('#tabla',trans('adminlte_lang::message.cellar').'s')}}

</script>

@endsection