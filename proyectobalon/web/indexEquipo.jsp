<%-- 
    Document   : indexEquipo
    Created on : 22-nov-2017, 21:11:03
    Author     : luis_
--%>
<!DOCTYPE html>
<%@page import="java.sql.*"%>
<%@page import="conneccion.ConnecionMYSQL"%>
<html>
<head>
<meta name="keywords" content="" />
<meta name="description" content="" />
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>Equipos</title>
<link href="styleEquipo.css" rel="stylesheet" type="text/css" media="screen" />
</head>

<body>
<div id="wrapper">
<div id="header">
<div id="logo">
<h1><a href="#">BallonBases</a></h1>			
</div>

</div>

<!-- end #header -->

<div id="menu">
<ul>
<li><a href="index.jsp">Inicio</a></li>
<li><a href="indexTorneo.jsp">Torneos</a></li>
<li class="current_page_item"><a href="#">Equipos</a></li>
<li><a href="indexJugador.jsp">Jugadores</a></li>
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

<h2 class="title"><a href="#">Creador de equipos</a></h2>

<div class="entry">							
<p>En esta pesta�a podr�s observar a los equipos participantes en todos los torneos registrados, adem�s tendr�s la oportunidad de observar a los mejores equipos teniendo en cuenta los partidos ganados y menor cantidad de faltas. Tambien podr�s crear un equipo, al cual posteriormente podr�s agregar los jugadores correspondientes.

    <br>
Disfruta, juega y crece...</p>

</div>

</div>


<div class="post">
<h2 class="title"><a href="#"> Crear un equipo nuevo </a></h2>

<div class="entry">
<p><class="alignleft border" />             
<form id="form1" name="form1" method="post" action="form_1.jsp">
Nombre del equipo:<br>
<input type="text" id="enombre" name="equiponombre" placeholder="Ingresar nombre equipo">
<br><br>
Entrenador:<br>
<select name="Entrenador">
<option value="1">Leonardo Moreno</option>
<option value="2">Andres Torres</option>
<option value="3">Luis Buitrago</option>
<option value="4">Cristhian Rozo</option>
<option value="5">Sebastian Duque</option>
<option value="6">Pepito Perz</option>
<option value="7">Pablo Gomez</option>
<option value="8">Sebastian Rozo</option>
<option value="9">Sol Soledad</option>
<option value="10">Juliana Casas</option>
<option value="11">Rosa Melcacho</option>
<option value="12">Valentina Pardo</option>
<option value="13">Isis Luchetti</option>
<option value="14">Hayley Vynall</option>
<option value="15">Dulce McCloy</option>
<option value="16">Susanne Smedmore</option>
<option value="17">Evelyn Daubeny</option>
<option value="18">Sayers Tarling</option>
<option value="19">Cary hollingdale</option>
<option value="20">Chery Whiting</option>


</select><br><br>
Color:<br>
<input type="text" id="cequipo" name="colorequipo" placeholder="Ingrese color representa. Ejem: Rojo">
<br><br>
Torneo:<br>
<select name="Torneo">
<option value="1">Suramericana</option>
<option value="2">Liga Promaster</option>
<option value="3"> BBA</option>
<option value="4">Wariors</option>
<option value="5">Copa Sabana</option>
</select><br><br>
<input type="submit" name="submit" id="submit" value="Enviar">
    <input type="reset" name="limpiar" id="limpiar" value="Limpiar">
</form> </p>
</div>
</div>

<div class="post">

<h2 class="title"><a href="#">Equipos inscritos</a></h2>
<div class="entry">
<p><class=" align left border" />
    <table style="width:170%">
<tr>
<th>Nombre Equipo</th>
<th>Nombre Entrenador</th> 
<th>Color</th>
<th>Torneo</th>
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
rs=sta.executeQuery("select e.nombre ,en.nombre, e.color, t.nombre  from equipo e inner join entrenador en on e.ID_entrenador = en.ID_entrenador inner join torneo t on e.ID_torneo = t.ID_torneo ");
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

<li>
<h2 class="title">Mejor equipo</h2>

<ul>
<%

try{
Class.forName("com.mysql.jdbc.Driver");
cnx =DriverManager.getConnection
("jdbc:mysql://localhost/balonbases?user=root&password=Ltp980928");
sta=cnx.createStatement();
rs=sta.executeQuery("select j.nombre  from equipo j inner join equipo_ranking_grupal e on j.ID_equipo =e.ID_equipo inner join ranking_grupal r on e.ID_ranking_grupal= r.ID_ranking_grupal");
while (rs.next()){

%>

<ul><li><%=rs.getString(1)%></li></ul>
<%
}
}
catch(Exception e){}      %>






</ul>
<img src="images/balon.jpg" alt="balon">
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
