<!DOCTYPE html>
<%@page import="java.sql.*"%>
    <%@page import="conneccion.ConnecionMYSQL"%>
<html>
    
<head>
<meta name="keywords" content="" />
<meta name="description" content="" />
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>Estadistica Individual</title>
<link href="styleEstIndividual.css" rel="stylesheet" type="text/css" media="screen" />
</head>
<body>
<div id="wrapper">
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
<li><a href="indexJugador.jsp">Jugadores</a></li>
<li><a href="indexEstGrupal.jsp">Estadistica Grupal</a></li>
<li class="current_page_item"><a href="#">Estadistica Individual</a></li>

</ul>
</div>
<!-- end #menu -->
<div id="page">
<div id="page-bgtop">
<div id="page-bgbtm">
<div id="content">
<div class="post">
<h2 class="title"><a href="#">Estadisticas Individuales</a></h2>
<div class="entry">							
<p>En esta pestaña podrás observar las estadisticas de cada uno de los jugadores participantes en todos los torneos y equipos registrados, la estadistica nos muestra en orden descendente todos los jugadores.

<br>
</p>
</div>
</div>
<div class="post">


<div class="entry">
<p><class="alignleft border" />             
<form action=Hola>



<br><br>






</select><br><br>

</form> </p>
</div>
</div>


<div class="post">

<h2 class="title"><a href="#">Estadistica</a></h2>
<div class="entry">
<p><class="alignleft border" />
<table style="width:170%">
<tr>
<th>Nombre Jugador</th>
<th>Nombre del Equipo</th> 
<th>Faltas</th>
<th>Rebotes</th>
<th>Canastas</th>
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
      rs=sta.executeQuery("select j.nombre ,e.nombre, ei.faltas,ei.rebotes,ei.canastas from jugador j inner join estadistica_indv ei on j.ID_jugador = ei.ID_jugador inner join equipo e on j.ID_equipo= e.ID_equipo ");
      while (rs.next()){
          %>
          <tr>
              <th><%=rs.getString(1) %></th>  
              <th><%=rs.getString(2) %></th>
                     <th><%=rs.getString(3) %></th> 
                         <th><%=rs.getString(4) %></th> 
                         <th><%=rs.getString(5) %></th> 
                 
          </tr><%
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


<h2>Estadisticas</h2>
<ul>
<p></p>
<p><img src="images/Estadisticas.jpg" width="
300" height="250" alt="" class="alignleft border" / ></p>



<p></p>




</li>

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
