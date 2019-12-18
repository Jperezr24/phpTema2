<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link href="/fa/font/css/all.css" rel="stylesheet">

    <title>Hello, world!</title>
  </head>
  <body>

  <nav class="navbar navbar-expand-sm bg-primary navbar-dark">
  <ul class="navbar-nav">
    <li class="nav-item active">
      <a class="nav-link" href="#">Inicio</a>
    </li>
  </ul>
  
</nav>
<h4 align="center" class="display-4">Display 2</h4>

    <div class="jumbotron text-center">
    
    <div class="container">
        <div class="row">
                <div class="table-responsive">




<?php

    $usuario = "root";
    $contrasena = "";
    $servidor = "localhost:3306";
    $basedeDatos = "practica2";
     
        // Conexión con el servidor de base de datos y selección de la base de datos
        $conexion = mysqli_connect($servidor, $usuario, $contrasena, $basedeDatos);
     
        if (!$conexion)
          exit('No se puede conectar:'. mysqli_error());
         
        if(!mysqli_select_db($conexion,"practica2"))
          exit("Error al conectar con la base de datos". mysqli_error());
         
        // Definimos la consulta que recuperará todos los datos de la tabla libros
        $consulta="SELECT * FROM Ninos;";
         
        // Hacemos la consulta al servidor y obtenemos la respuesta
        $resultado = mysqli_query($conexion, $consulta);
         
        if( mysqli_num_rows($resultado) > 0) {

            echo "<form action='busqueda2.php' method='post'>";
            echo "<select name='nombredeninos'>";

            while($fila = mysqli_fetch_array($resultado)) {

            echo "<option value='".$fila['idNino']."'>".$fila['nombreNino']."</option>";
             }
            echo "</select>";
            echo "<input type='submit' value='Aceptar'>";
            echo "</form>";

            
        }


        

        

     ?>









                </div>
        </div>
    </div>


    </div>

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  </body>
</html>