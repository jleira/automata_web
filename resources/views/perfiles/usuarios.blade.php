@extends('layouts.app')

@section('header')
<link rel="stylesheet" href="{{ asset('public/plugins/datatables/dataTables.bootstrap.css')}}"/>
@endsection

@section('htmlheader_title')
{{ trans('adminlte_lang::message.cellar') }}
@endsection

@section('main-content')
<div class="row">
@if(Session::has('error_message'))
	<div class="alert alert-danger alert-dismissable fade in">
		<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
		<strong>{{ trans('adminlte_lang::message.error') }}!</strong> {{Session::get('error_message')}}
	</div>
	@endif
	@if(Session::has('success_message'))
	<div class="alert alert-danger alert-dismissable fade in">
		<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
		<strong>{{ trans('adminlte_lang::message.success') }}!</strong> {{Session::get('success_message')}}
	</div>
	@endif

	@if (count($errors) > 0)
        <div class="alert alert-danger">
            <strong>Whoops!</strong> {{ trans('adminlte_lang::message.someproblems') }}<br><br>
            <ul>
                @foreach ($errors->all() as $error)
                    <li>{{ $error }}</li>
                @endforeach
            </ul>
        </div>
    @endif

<div class="modal fade" id="agregarusuario">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">{{ trans('adminlte_lang::message.new') }} {{ trans('adminlte_lang::message.user') }}</h4>
              </div>
							<form action="{{ url('perfiles/usuarios/nuevousuario') }}" method="post">
							<div class="modal-body">
							<input type="hidden" name="_token" value="{{ csrf_token() }}">
  <div class="form-group">
    <label >{{ trans('adminlte_lang::message.name') }}</label>
    <input type="text" class="form-control " id="nombre" name="nombre"  value="{{ old('nombre')}}">
  </div>

  <div class="form-group">
    <label >{{ trans('adminlte_lang::message.nick') }}</label>
    <input type="text" class="form-control " id="nick" name="nick"  value="{{ old('nick')}}">
  </div>
  <div class="form-group">
    <label >{{ trans('adminlte_lang::message.email') }}</label>
    <input type="email" class="form-control " id="correo" name="correo"  value="{{ old('correo')}}">
  </div>
	<div class="form-group">
		<label >{{ trans('adminlte_lang::message.password') }}</label>
		    <input type="password" class="form-control " id="password"  name="password" >
	</div>
	<div class="form-group">
		<label >{{ trans('adminlte_lang::message.confirmpasswrd') }}</label>
				<input type="password" class="form-control " id="password_confirmation"  name="password_confirmation" >
	</div>

  <div class="form-group">
    <label >{{ trans('adminlte_lang::message.cel') }}</label>
    <input type="text" class="form-control " id="telefono" name="telefono"  value="{{ old('telefono')}}">
  </div>
  <div class="form-group">
    <label >{{ trans('adminlte_lang::message.generalinfo') }}</label>
    <textarea rows="5" class="form-control " id="info" name="info"> {{ old('info')}}</textarea>
  </div>


  <div class="checkbox">
    <label><input name="administrador" type="checkbox"> Administrador</label>
  </div>



              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-default pull-left" data-dismiss="modal">{{ trans('adminlte_lang::message.cancel') }}</button>
								<button type="submit" class="btn btn-default">{{ trans('adminlte_lang::message.save') }}</button>
              </div>

</form>

            </div>
            <!-- /.modal-content -->
          </div>
          <!-- /.modal-dialog -->
        </div>
	<div class="col-lg-12">
    <button style="margin-bottom:5px" type="button" data-toggle="modal" class="btn btn-info" data-target="#agregarusuario">{{ trans('adminlte_lang::message.create') }} {{ trans('adminlte_lang::message.user') }}</button>

		<div class="panel panel-primary">
			<div class="panel-body">
				<table id="tabla" class="table table-bordered table-striped">
					<thead>
						<tr>
							<th>ID</th>
							<th>{{ trans('adminlte_lang::message.name') }}</th>
							<th>{{ trans('adminlte_lang::message.description') }}</th>
                            <th>{{ trans('adminlte_lang::message.action') }}</th>
						</tr>
					</thead>
					<tbody>
						@foreach ($items as $rol)
						<tr>
							<td>{{$rol->id}}</td>
							<td>{{$rol->name}}</td>
							<td>{{$rol->nick}}</td>
                            <td>acctiones</td>
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

{{datatables('#tabla',trans('adminlte_lang::message.user').'s' )}}

</script>

@endsection
