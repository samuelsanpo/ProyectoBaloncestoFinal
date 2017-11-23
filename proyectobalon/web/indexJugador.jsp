<%-- 
    Document   : indexJugador
    Created on : 22-nov-2017, 21:11:46
    Author     : luis_
--%>
<%@page import="java.sql.*"%>
<%@page import="conneccion.ConnecionMYSQL"%>
<!DOCTYPE html>

<html>
<head>
<meta name="keywords" content="" />
<meta name="description" content="" />
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>Jugadores</title>
<link href="styleJugador.css" rel="stylesheet" type="text/css" media="screen" />
</head>
<body>
<div id="header">
<div id="logo">
<h1><a href="#">BallonBases</a></h1>			
</div>
<div id="search">
<form method="get" action="">
<fieldset>
<input type="submit" id="search-submit" value="GO" />
</fieldset>
</form>
</div>
</div>
<!-- end #header -->
<div id="menu">
<ul>
<li><a href="index.jsp">Inicio</a></li>
<li><a href="indexTorneo.jsp">Torneos</a></li>
<li><a href="indexEquipo.jsp">Equipos</a></li>
<li class="current_page_item"><a href="#">Jugadores</a></li>
<li><a href="indexEstGrupal.jsp">Estadistica grupal</a></li>
<li><a href="indexEstIndividual.jsp">Estadistica individual</a></li>




</ul>
</div>
<!-- end #menu -->
<div id="page">
<div id="page-bgtop">
<div id="page-bgbtm">
<div id="content">
<div class="post">
<h2 class="title"><a href="#">Creador de Jugadores</a></h2>
<div class="entry">							
<p>En esta pestaña podrás observar jugadores participantes en todos los torneos y equipos registrados, además tendrás la oportunidad de observar a los mejores juagdores teniendo en cuenta los puntos anotados. Tambien podrás crear jugadores, correspondientes a los equipos ya establecidos.

<br>
Disfruta, juega y crece...</p>
</div>
</div>
<div class="post">
<h2 class="title"><a href="#"> Crear un jugador nuevo </a></h2>

<div class="entry">
<p><class="alignleft border" />             

    
    
    <form id="form1" name="form1" method="post" action="form_2.jsp">
Nombre del Jugador:<br>
<input type="text" id="jnombre" name="jugadornombre" placeholder="Ingresar nombre juagdor">
<br><br>
Cedula:<br>
<input type="text" id="jcedula" name="jugadorcedula" placeholder="Ingrese la Cedula del juagdor">
<br><br>
Genero:<br>
<select name="Genero">
<option value="Masculino">Hombre</option>
<option value="Femenino">Mujer</option>
</select>
<br><br>
Fecha Nacimiento (1999-07-15):<br>
<input type="text" id="jnombre" name="fechanacimiento" placeholder="Ingresar fecha de nacimiento">
<br><br>
Equipo:<br>
<select name="Equipo">
<option value="1">Leones</option>
<option value="2">Real bañil</option>
<<option value="3">Santa fe</option>
<option value="4">real sociedad</option>
<option value="5">Becka</option>
<option value="6">Kerstin</option>
<option value="7">Balduin</option>
<option value="8">Harriot</option>
<option value="9">Petitfelas</option>
<option value="10">Elwood</option>
<option value="11">Jeffy</option>
<option value="12">Galen</option>
<option value="13">Tapitas</option>
<option value="14">Mejores</option>
<option value="15">Extancia</option>
<option value="16">La Mafia</option>
</select><br><br>
<input type="submit" name="submit" id="submit" value="Enviar">
    <input type="reset" name="limpiar" id="limpiar" value="Limpiar">
</form> </p>
</div>
</div>

<br>
<br>
<br>
<h2 class="title"><a href="#">Jugadores Inscritos</a></h2>
<div id="overflowTest" class="post">


<div class="entry">
<p><class="alignleft border" />


<script  src="BuscadorTabla.js" type="text/javascript"></script>
<div class="field" id="searchform">
  <input type="text" id="searchterm" onkeyup="doSearch()" placeholder="Buscar un jugador" />
  
</div>

<table  id="datos" style="width:100%">
<tr>
<th>Nombre Jugador</th>
<th>Cedula Jugador</th> 
<th>Genero Jugador</th>
<th>Equipo</th>
</tr>
<%
Connection cnx = null;
Statement sta = null;
ResultSet rs= null;
try{
Class.forName("com.mysql.jdbc.Driver");
cnx =DriverManager.getConnection
("jdbc:mysql://localhost/balonbases?user=root&password=Online123");
sta=cnx.createStatement();
rs=sta.executeQuery("select j.nombre , j.documento, j.genero, e.nombre  from jugador j inner join equipo e on j.ID_equipo=e.ID_equipo ");
while (rs.next()){
%>
<tr>
<td><%=rs.getString(1) %></td>  
<td><%=rs.getString(2) %></td>
<td><%=rs.getString(3) %></td> 
<td><%=rs.getString(4) %></td> 

</tr>
<%
}
}
catch(Exception e){}      %>

</table></p>
</div>
</div>
<div style="clear: both;">&nbsp;</div>
</div>
<!-- end #content -->
<div id="sidebar">
<ul>

<h2>Maxima Anotadora Mujer</h2>
<ul>
<p></p>
<p><img src="images/Mujer.jpg" width="300" height="250" alt="" class="alignleft border" / ></p>
<p>Martina Franca </p>

<h2 class="title">MVP</h2>


<%
    
      try{
      Class.forName("com.mysql.jdbc.Driver");
      cnx =DriverManager.getConnection
              ("jdbc:mysql://localhost/balonbases?user=root&password=Online123");
      sta=cnx.createStatement();
      rs=sta.executeQuery("select j.nombre  from jugador j inner join jugador_ranking_indv e on j.ID_jugador =e.ID_jugador inner join ranking_indv r on e.ID_ranking_indv= r.ID_ranking_indv");
      while (rs.next()){
          %>
          
            <p><img src="images/mvp.jpg" width="250" height="350" alt="" class="alignleft border" / ></p>
       <p><%=rs.getString(1)%></p>
                 
          
          <%
      }
      }
      catch(Exception e){}      %>
<p></p>

</ul>
</div>

<!-- end #sidebar -->

<div style="clear: both;">&nbsp;</div>
</div>
</div>
</div>
<!-- end #page -->
</div>
<div id="footer">

</div>
<!-- end #footer -->
</body>
</html>


