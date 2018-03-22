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
				<table id="tabla" class="table table-bordered table-striped">
					<thead>
						<tr>
							<th>ID</th>
							<th>{{ trans('adminlte_lang::message.name') }}</th>
							<th>{{ trans('adminlte_lang::message.description') }}</th>
						</tr>
					</thead>
					<tbody>
						@foreach ($roles as $rol)
						<tr>
							<td>{{$rol->codigo}}</td>
							<td>{{$rol->valor}}</td>
							<td>{{$rol->descripcion}}</td>
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

{{datatables('#tabla','Roles')}}

</script>

@endsection