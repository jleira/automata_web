@extends('layouts.app')


@section('htmlheader_title')
{{$nombre}}
@endsection

@section('main-content')


<div class="row">
	<div class="col-lg-12">

		<div class="panel panel-primary">
		<div class="panel-body">
	<a href="{{url('contacto/perfil'.'/'.$id.'/editar')}}" class="btn btn-primary"><i class="fa fa-edit"></i> {{trans('adminlte_lang::message.edit')}}</a>

	<a href="{{url('contacto/perfil'.'/'.$id.'/editar')}}" class="btn btn-primary"><i class="fa fa-edit"></i> {{trans('adminlte_lang::message.edit')}}</a>

	<a href="{{url('contacto/perfil'.'/'.$id.'/editar')}}" class="btn btn-primary"><i class="fa fa-edit"></i> {{trans('adminlte_lang::message.edit')}}</a>

	<a href="{{url('contacto/perfil'.'/'.$id.'/editar')}}" class="btn btn-primary"><i class="fa fa-edit"></i> {{trans('adminlte_lang::message.edit')}}</a>

	<a href="{{url('contacto/perfil'.'/'.$id.'/editar')}}" class="btn btn-primary"><i class="fa fa-edit"></i> {{trans('adminlte_lang::message.edit')}}</a>				
		</div>
		</div>
		</div>
	<div class="col-lg-6">

		<div class="panel panel-primary">
			<!-- /.box-header -->
			<div class="panel-body">
				<table id="tabla" class="table table-bordered table-striped">
					<tbody>
						@foreach ($clientes as $cliente)
						<tr>
							<td>id</td>
							<td>{{$cliente->id_contacto}}</td>
						</tr>
						<tr>
							<td>{{ trans('adminlte_lang::message.name') }}</td>
							<td>{{$cliente->nombre}}</td>
						</tr>
						<tr>
							<td>Nit</td>
							<td>{{$cliente->nit}}</td>
						</tr>
						<tr>
							<td>{{ trans('adminlte_lang::message.profile')}} {{ trans('adminlte_lang::message.of')}} {{ trans('adminlte_lang::message.contact')}}</td>
							@if($cliente->perfil==3)
							<td>{{ trans('adminlte_lang::message.client')}} {{ trans('adminlte_lang::message.and')}} {{ trans('adminlte_lang::message.provider')}}</td>
							@else
							<td>{{trans('adminlte_lang::message.'.lista(1,$cliente->perfil,1))}}</td>
							@endif
						</tr>
						
						<tr>
							<td>{{ trans('adminlte_lang::message.address') }}</td>
							<td>{{$cliente->direccion}}</td>
						</tr>
						<tr>
							<td>{{ trans('adminlte_lang::message.city') }}</td>
							<td>{{$cliente->ciudad}}</td>
						</tr>
						<tr>
							<td>{{ trans('adminlte_lang::message.phone') }}</td>
							<td>{{$cliente->telefono}}</td>
						</tr>
						<tr>
							<td>{{ trans('adminlte_lang::message.phone') }} 2</td>
							<td>{{$cliente->telefono_2}}</td>
						</tr>
						<tr>
							<td>Fax</td>
							<td>{{$cliente->fax}}</td>
						</tr>
						<tr>
							<td>{{ trans('adminlte_lang::message.cell') }}</td>
							<td>{{$cliente->celular}}</td>
						</tr>
						<tr>
							<td>{{ trans('adminlte_lang::message.email') }}</td>
							<td>{{$cliente->correo}}</td>
						</tr>
						<tr>
							<td>{{ trans('adminlte_lang::message.note') }}</td>
							<td><p>{{$cliente->nota}}</p></td>
						</tr>
						<tr>
							<td>{{ trans('adminlte_lang::message.discount') }}</td>
							<td>{{$cliente->descuento}} %</td>
						</tr>
						<tr>
							<td>{{ trans('adminlte_lang::message.credit') }}</td>
							<td>{{number_format($cliente->credito)}}</td>
						</tr>
						<tr>
							<td>{{ trans('adminlte_lang::message.pay_term') }}</td>
							<td>{{number_format($cliente->termino)}} {{ trans('adminlte_lang::message.day') }}s</td>
						</tr>
						@endforeach

					</tbody>

				</table>
			</div>
		</div>
	</div>
</div>


@endsection

