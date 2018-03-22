<?php

function datatables($table,$caso)
{
$idioma=idioma();
if ($idioma=='en') {

echo '	$(function () {
		$("'.$table.'").DataTable({
			"language": {
				"lengthMenu": "Show _MENU_ '.$caso.' per page",
				"zeroRecords": "No registered '.$caso.' ",
				"info": "Page _PAGE_ of _PAGES_",
				"infoEmpty": "",
				"infoFiltered": "(Filtered of _MAX_ '.$caso.' )",
				"search":"",
				"searchPlaceholder": "Search"
			}
		});
	});
	';

}else{

echo '	$(function () {
		$("'.$table.'").DataTable({
			"language": {
				"lengthMenu": "Mostrar _MENU_ '.$caso.' por pagina",
				"zeroRecords": "No hay '.$caso.' registrados",
				"info": "Pagina _PAGE_ de _PAGES_",
				"infoEmpty": "",
				"infoFiltered": "(Filtrado de _MAX_ '.$caso.' )",
				"search":"",
				"searchPlaceholder": "Buscar",
				"paginate": {
					"first":      "Primero",
					"last":       "Ultimo",
					"next":       "Siguiente",
					"previous":   "Anterior"
				}
			}
		});
	});
	';
}

}