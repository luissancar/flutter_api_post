

<?php

//http://iesayala.ddns.net/json/insertguitar.php?marca=fender&modelo=telecaster&precio=2000


$server = "localhost";
$user = "root";
$pass = "clave";
$bd = "guitarras";

//Creamos la conexión
$conexion = mysqli_connect($server, $user, $pass,$bd)
or die("Ha sucedido un error inexperado en la conexion de la base de datos");

//generamos la consulta
$marca = $_GET["marca"];
$modelo = $_GET["modelo"];
$precio = $_GET["precio"];

  $sql = "INSERT INTO guitarra (marca, modelo, precio) VALUES ('$marca', '$modelo', $precio)";
echo $sql;

mysqli_set_charset($conexion, "utf8"); //formato de datos utf8
if (mysqli_query($conexion, $sql)) {
      echo "New record created successfully";
} else {
      echo "Error: " . $sql . "<br>" . mysqli_error($conexion);
}

//desconectamos la base de datos
$close = mysqli_close($conexion)
or die("Ha sucedido un error inexperado en la desconexion de la base de datos");




?>