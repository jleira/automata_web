@extends('layouts.app')

@section('header')
<link rel="stylesheet" href="{{ asset('public/plugins/datatables/dataTables.bootstrap.css')}}"/>
@endsection

@section('htmlheader_title')
{{ trans('adminlte_lang::message.material') }}s
@endsection


@section('main-content')


<div class="row">
	<div class="col-lg-12">
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
		<div class="panel panel-primary">
		<div class="panel-body">
            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#nuevacategoria">
                <i class="fa fa-plus"></i> {{trans('adminlte_lang::message.new')}} {{trans('adminlte_lang::message.category')}}
            </button>
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
							<th>{{trans('adminlte_lang::message.description')}}</th>
							<th>{{trans('adminlte_lang::message.action')}}</th>
						</tr>
					</thead>
					<tbody>
						@foreach ($items as $item)
						<tr>
							<td>{{$item->nombre}}</td>
							<td>{{$item->referencia}}</td>
							<td>{{$item->descripcion}}</td>
							<td style="text-align: center;">
								<a style="color: green" title="{{trans('a.editar')}}" href="javascript:editar('{{$item->id_categoria}}','{{$item->nombre}}','{{$item->referencia}}','{{$item->descripcion}}');"><i class='fa fa-edit' style="margin: 0% 5%;"></i></a>	
<!-- 								<a style="color: red" href="{{url('editarmaterial/'.$item->id_categoria)}}"><i class='fa fa-trash' style="margin: 0% 5%;"></i></a>
 -->							</td>
						</tr>

						@endforeach

					</tbody>

				</table>
			</div>
		</div>
	</div>
</div>

<div id="nuevacategoria" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">{{trans('adminlte_lang::message.new')}} {{trans('adminlte_lang::message.category')}}</h4>
      </div>
      <div class="modal-body">

        <form role="form" enctype="multipart/form-data" method="POST" action="{{ url('material/nuevacategoria') }}">
        {{ csrf_field() }}
        <div class="form-group">
        <label for="name">Nombre</label>
        <input type="text" class="form-control" name="nombre">
        </div>
        <div class="form-group">
        <label for="referencia">Referencia</label>
        <input type="text" class="form-control" name="referencia">
        </div>
        <div class="form-group">
            <label for="name">Descripcion</label>
            <input type="text" class="form-control" name="descripcion">
        </div>
        <button type="submit" class="btn btn-success">{{trans('adminlte_lang::message.save')}}</button>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">{{trans('adminlte_lang::message.close')}}</button>
      </div>
    </div>

  </div>
</div>

<div id="editarcategoria" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">{{trans('adminlte_lang::message.edit')}} {{trans('adminlte_lang::message.category')}} </h4>
      </div>
      <div class="modal-body">

        <form role="form" enctype="multipart/form-data" method="POST" action="{{ url('material/editarcategoria') }}">
        {{ csrf_field() }}
        <div class="form-group">
        <label for="name">Id</label>
        <input type="hidden" class="form-control" name="id" id="id">
        </div>
        <div class="form-group">
        <label for="name">Nombre</label>
        <input type="text" class="form-control" name="nombre" id="nombre">
        </div>
        <div class="form-group">
        <label for="referencia">Referencia</label>
        <input type="text" class="form-control" name="referencia" id="referencia">
        </div>
        <div class="form-group">
            <label for="name">Descripcion</label>
            <input type="text" class="form-control" name="descripcion" id="descripcion">
        </div>
        <button type="submit" class="btn btn-success">{{trans('adminlte_lang::message.editar')}}</button>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">{{trans('adminlte_lang::message.close')}}</button>
      </div>
    </div>

  </div>
</div>


@endsection

@section('script')

<script src="{{ url('public/plugins/datatables/jquery.dataTables.min.js')}}"></script>
<script src="{{ url('public/plugins/datatables/dataTables.bootstrap.min.js')}}"></script>
<script type="text/javascript">

{{datatables('#tabla',trans('adminlte_lang::message.category'))}}

function editar(id, nombre, referencia, descripcion){
    console.log(id, nombre, referencia, descripcion);
    $("#id").val(id);
    $("#nombre").val(nombre);
    $("#referencia").val(referencia);
    $("#descripcion").val(descripcion);
    
    $("#editarcategoria").modal();
}

</script>

@endsection