@extends('layouts.app')

@section('header')
<link rel="stylesheet" href="{{ asset('public/plugins/datatables/dataTables.bootstrap.css')}}"/>
@endsection

@section('htmlheader_title')
{{ trans('adminlte_lang::message.'.$contact) }}
@endsection

@php
$item='cliente';
if($contact=='provider'){
$item='proveedor';	
}
@endphp



@section('main-content')


<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-primary">
		<div class="panel-body">
	<a href="{{url('contacto/nuevo'.'/'.$item)}}" class="btn btn-primary"><i class="fa fa-plus"></i> {{trans('adminlte_lang::message.new')}} {{trans('adminlte_lang::message.'.$contact)}}</a>			
		</div>
		</div>

		<div class="panel panel-primary">
			<!-- /.box-header -->
			<div class="panel-body">
				<table id="tabla" class="table table-bordered table-striped">
					<thead>
						<tr>
							<th>{{trans('adminlte_lang::message.name')}}</th>
							<th>Nit</th>
							<th>{{trans('adminlte_lang::message.phone')}} 1</th>
							<th>{{trans('adminlte_lang::message.note')}}</th>
							<th>{{trans('adminlte_lang::message.action')}}</th>
						</tr>
					</thead>
					<tbody>
						@foreach ($clientes as $cliente)
						<tr>
							<td>{{$cliente->nombre}}</td>
							<td>{{$cliente->nit}}</td>
							<td>{{$cliente->telefono}}</td>
							<td>{{recortar($cliente->nota,70)}}</td>
							<td style="text-align: center;" >
								<a style="color: cyan" href="{{url('contacto/perfil'.'/'.$cliente->id_contacto)}}"><i class='fa fa-eye' style="margin: 0% 5%;"></i></a>
								<a style="color: green" href="{{url('contacto/perfil'.'/'.$cliente->id_contacto.'/editar')}}"><i class='fa fa-edit' style="margin: 0% 5%;"></i></a>	
								<a style="color: red" href="{{url('editarcliente/'.$cliente->id_contacto)}}"><i class='fa fa-trash' style="margin: 0% 5%;"></i></a>
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

{{datatables('#tabla',trans('adminlte_lang::message.'.$contact).'s')}}

</script>

@endsection