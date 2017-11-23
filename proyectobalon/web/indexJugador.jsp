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
			<li class="current_page_item"><a href="#">Jugadores</a></li>

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
							<form action=Hola>
 						Nombre del Jugador:<br>
  						<input type="text" id="jnombre" name="jugadornombre" placeholder="Ingresar nombre juagdor">
  						<br><br>
  						Cedula:<br>
  						<input type="text" id="jcedula" name="jugadorcedula" placeholder="Ingrese la Cedula del juagdor">
  						<br><br>
  						Genero:<br>
  						<input type="radio" name="gender" value="male" checked> Male<br>
  <input type="radio" name="gender" value="female"> Female<br>
  						<br><br>
  						Fecha de Nacimiento:
  <input type="date" name="bday" max="2004-01-01" min="1977-01-01"><br>

 

						
  						Equipo:<br>
  						<select name="Equipo">
    						<option value="volvo">Golden Sate</option>
   							<option value="saab">Cleveland Cavaliers</optio>
    						<option value="fiat">Miami Heat</option>
    						<option value="audi">LA</option>
  						</select><br><br>
  						<button  class= "button" type= "button" onclick="alert('Ha creado un jugador exitosamente!')">Crear Jugador </button>
  						</form> </p>
						</div>
					</div>


					<div class="post">

						<h2 class="title"><a href="#">Jugadores Inscritos</a></h2>
						<div class="entry">
							<p><class="alignleft border" />
								<table style="width:170%">
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
              ("jdbc:mysql://localhost/balonbases?user=root&password=Ltp980928");
      sta=cnx.createStatement();
      rs=sta.executeQuery("select j.nombre , j.documento, j.genero, e.nombre  from jugador j inner join equipo e on j.ID_equipo=e.ID_equipo ");
      while (rs.next()){
          %>
          <tr>
              <th><%=rs.getString(1) %></th>  
              <th><%=rs.getString(2) %></th>
                     <th><%=rs.getString(3) %></th> 
                         <th><%=rs.getString(4) %></th> 
                 
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
							

							<h2>Maxima Anotadora Mujer</h2>
							<ul>
								<p></p>
							<p><img src="images/Mujer.jpg" width="300" height="250" alt="" class="alignleft border" / ></p>
							<p>Martina Franca </p>

							<h2 class="title">MVP</h2>

							<p><img src="images/mvp.jpg" width="250" height="350" alt="" class="alignleft border" / ></p>
							<p>Stephen Curry </p>
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
