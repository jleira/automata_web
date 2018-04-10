<!-- Left side column. contains the logo and sidebar -->
<aside class="main-sidebar">

    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">

        <!-- Sidebar user panel (optional) -->
   
        <!-- search form (Optional) -->
        <form action="#" method="get" class="sidebar-form">
            <div class="input-group">
                <input type="text" name="q" class="form-control" placeholder="{{ trans('adminlte_lang::message.search') }}..."/>
              <span class="input-group-btn">
                <button type='submit' name='search' id='search-btn' class="btn btn-flat"><i class="fa fa-search"></i></button>
              </span>
            </div>
        </form>
        <!-- /.search form -->

        <!-- Sidebar Menu -->
        <ul class="sidebar-menu">
            <li class="header">{{ trans('adminlte_lang::message.header') }}</li>
            <li class="{{active('home')}}"><a href="{{ url('home') }}"><i class='fa fa-link'></i> <span>{{ trans('adminlte_lang::message.home') }}</span></a></li>
            <li class="{{active('contacto')}}" class="treeview">
                <a href="#"><i class='fa fa-link'></i> <span>{{ trans('adminlte_lang::message.contact') }}s</span> <i class="fa fa-angle-left pull-right"></i></a>
                <ul class="treeview-menu">
                <li class="{{active('contactos')}}"><a href="{{url('contactos')}}">{{ trans('a.todos') }}</a></li>
                <li class="{{active('contacto/cliente')}}"><a href="{{url('contacto/clientes')}}">{{ trans('a.client') }}s</a></li>
                <li class="{{active('contacto/proveedores')}}"><a href="{{url('contacto/proveedores')}}">{{ trans('a.provider') }}{{s()}}</a></li>
                <li class="{{active('contacto/nuevo')}}"><a href="{{url('contacto/nuevo')}}">{{ trans('a.nuevo') }}</a></li>                    
                </ul>
            </li>
            <li class="{{active('bodega')}}" class="treeview">
                <a href="#"><i class='fa fa-industry'></i> <span>{{ trans('a.bodega') }}s</span> <i class="fa fa-angle-left pull-right"></i></a>
                <ul class="treeview-menu">
                <li class="{{active('bodegas')}}"><a href="{{url('bodegas')}}">{{ trans('a.todos') }}</a></li>
                <li class="{{active('bodega/nuevo')}}"><a href="{{url('bodega/nuevo')}}">{{ trans('a.nuevo') }}</a></li>                    
                </ul>
            </li>

            <li class="{{active('producto')}}" class="treeview">
                <a href="#"><i class='fa fa-plus'></i> <span>{{ trans('adminlte_lang::message.product') }}s</span> <i class="fa fa-angle-left pull-right"></i></a>
                <ul class="treeview-menu">
                <li class="{{active('productos')}}"><a href="{{url('productos')}}">{{ trans('a.todos') }}</a></li>
                <li class="{{active('producto/nuevo')}}"><a href="{{url('producto/nuevo')}}">{{ trans('a.nuevo') }}</a></li>                    
                </ul>
            </li>

            <li class="{{active('material')}}" class="treeview">
                <a href="#"><i class='fa fa-plus'></i> <span>{{ trans('a.material') }}</span> <i class="fa fa-angle-left pull-right"></i></a>
                <ul class="treeview-menu">
                <li class="{{active('materiales')}}"><a href="{{url('materiales')}}">{{ trans('a.todos') }}</a></li>
                <li class="{{active('material/nuevo')}}"><a href="{{url('material/nuevo')}}">{{ trans('a.nuevo') }}</a></li>
                <li class="{{active('material/nuevacategoria')}}"><a href="{{url('material/nuevacategoria')}}">{{ trans('a.categoria') }}</a></li>                
                </ul>
            </li>

            <li class="treeview {{active('perfiles')}}">
                <a href="#"><i class='fa fa-link'></i> <span>{{ trans('adminlte_lang::message.user') }}s</span> <i class="fa fa-angle-left pull-right"></i></a>
                <ul class="treeview-menu">
                    <li class="{{active('perfiles/usuarios')}}"><a href="{{url('perfiles/usuarios')}}">Usuarios</a></li>
                    <li class="{{active('perfiles/roles')}}" ><a href="{{url('perfiles/roles')}}">Roles</a></li>
                </ul>
            </li>


        </ul><!-- /.sidebar-menu -->
    </section>
    <!-- /.sidebar -->
</aside>
