<?php

function recortar($cadena, $largo)
{
	if (strlen($cadena)<=$largo) {
	return $cadena;
	}
return substr($cadena, 0, $largo).'...';
}

