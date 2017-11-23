<%-- 
    Document   : indexTorneo
    Created on : 22-nov-2017, 21:12:14
    Author     : luis_
--%>

<!DOCTYPE html5>
<%@page import="java.sql.*"%>
<%@page import="conneccion.ConnecionMYSQL"%>

<html>
<head>
<meta name="keywords" content="" />
<meta name="description" content="" />
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>Torneos</title>
<link href="styleTorneo.css" rel="stylesheet" type="text/css" media="screen" />
<script class="cssdeck" src="//cdnjs.cloudflare.com/ajax/libs/jquery/1.8.0/jquery.min.js"></script>
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
<li class="current_page_item"><a href="indexTorneo.jsp">Torneos</a></li>
<li ><a href="indexEquipo.jsp">Equipos</a></li>
<li><a href="indexJugador.jsp">Jugadores</a></li>

</ul>
</div>
<!-- end #menu -->
<div id="page">
<div id="page-bgtop">
<div id="page-bgbtm">
<div id="content">

<div class="post">
<h2 class="title"><a href="#"> Crear un torneo nuevo </a></h2>

<div class="entry">
<p><class= " alignleft border" />             
   
 <%
 String url,query;
 String nombre,lugar,genero;
 int edad,fixture;
  Connection conexion=null; 
   Statement consulta=null;
   ResultSet resultado=null;
try{
       Class.forName("com.mysql.jdbc.Driver").newInstance(); 
       url="jdbc:mysql://localhost/bdform";
       conexion=DriverManager.getConnection(url,"root","Online123");
       if(conexion!=null){
         nombre=request.getParameter("torneonombre");
         lugar=request.getParameter("torneolugar");
         
         genero=request.getParameter("Genero");
         
         fixture=Integer.parseInt(request.getParameter("Fixture")); 
        
       
query="insert into torneo (nombre,lugar,ID_fixture)values ('"+nombre+"','"+lugar+"',"+fixture+")";
          consulta=conexion.createStatement();//envia datos
          consulta.executeUpdate(query);   
          
          out.print("<script>alert('REGISTRO GUARDADO');</script>");
     out.print("<META HTTP-EQUIV='REFRESH' CONTENT='0;URL=formulario.html'>");
       }
       else{
           out.print("<script>    alert('NO HAY CONEXION');</script>");
           out.print("<META HTTP-EQUIV='REFRESH' CONTENT='0;URL=formulario.html'>");
       }}
     catch(Exception e){
        out.print(e);}
   
%>
    
    
    
    
    
    
    
    
    <form id="form1" name="form1" method="post" action="form.jsp">
        
Nombre del torneo:<br>
<input type="text" id="tnombre" name="torneonombre" placeholder="Ingresar nombre torneo">
<br><br>
Lugar:<br>
<input type="text" id="tlugar" name="torneolugar" placeholder="Ingrese el lugar ">
<br><br>
Fixture:<br>
<select name="Fixture">
<option value="1">Todos contra todos</option>
<option value="2">Eliminacion directa</option>
</select><br><br>
Categoria:<br>
<select name="Categoria">
<option value="1">Masculino/20</option>
<option value="2">Femenino/20</option>
<option value="3">Masculino/15</option>
</select><br><br>


<input type="submit" name="submit" id="submit" value="Enviar">
    <input type="reset" name="limpiar" id="limpiar" value="Limpiar">
</form> 
</div>
</div>


<div class="post">

<h2 class="title"><a href="#">Lista de torneos</a></h2>
<div class="entry">
<p><class=" alignleft border" />
  <br>
    <script  src="BuscadorTabla.js" type="text/javascript"></script>
<div class="field" id="searchform">
  <input type="text" id="searchterm" onkeyup="doSearch()" placeholder="Buscar un torneo" />
  
</div>
<br>
  <br>

  
<table id="datos" >
<tr>
    <th>Nombre Torneo</th>
    <th>Lugar</th> 
    <th>Fixture</th>
    <th>Genero</th>
    <th>Categoria(años)</th>
  </tr>
  <%
      Connection cnx = null;
      Statement sta = null;
      ResultSet rs= null;
      try{
      Class.forName("com.mysql.jdbc.Driver");
      cnx =DriverManager.getConnection
              ("jdbc:mysql://localhost/balonbases?user=root&password=011099");
      sta=cnx.createStatement();
      rs=sta.executeQuery("select t.nombre ,t.lugar, f.descripcion,c.genero,c.edad from torneo t inner join fixture f on t.ID_fixture = f.ID_fixture inner join categoria c on t.ID_categoria= c.ID_categoria ");
      while (rs.next()){
          %>
          <tr>
              <td><%=rs.getString(1) %></td>  
              <td><%=rs.getString(2) %></td>
              <td><%=rs.getString(3) %></td> 
              <td><%=rs.getString(4) %></td> 
              <td><%=rs.getString(5) %></td> 
                 
          </tr>
          <%
      }
      }
      catch(Exception e){}      %>
  
</table> </p>
</div>
</div>
<div style="clear: both;">&nbsp;</div>
</div>
<!-- end #content -->
<div id="sidebar">
<ul>

<li>
<IMG SRC="images/baloncesto1.gif">
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

