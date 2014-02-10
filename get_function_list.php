<?php

$all_defined_funcs = get_defined_functions();

$root_dir = getcwd();
$func_txt = $root_dir.'/php_functions.txt';
$file = fopen($func_txt, 'w');

foreach($all_defined_funcs['internal'] as $v){
    fwrite($file, $v."\r\n");
}
fclose($file);
?>
