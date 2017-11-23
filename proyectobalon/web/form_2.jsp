<%@page import="java.sql.*"%>
 <%
 String url,query;
 String nombre,genero,fecha;
 int cedula,equipo;
  Connection conexion=null; 
   Statement consulta=null;
   ResultSet resultado=null;
try{
       Class.forName("com.mysql.jdbc.Driver").newInstance(); 
       url="jdbc:mysql://localhost/balonbases";
       conexion=DriverManager.getConnection(url,"root","Online123");
       if(conexion!=null){
         nombre=request.getParameter("jugadornombre");
         genero=request.getParameter("Genero");
         fecha=request.getParameter("fechanacimiento");
         cedula=Integer.parseInt(request.getParameter("jugadorcedula"));
         equipo=Integer.parseInt(request.getParameter("Equipo")); 
        
       
query="insert into jugador (nombre,genero,fechanacimiento,documento,ID_equipo)values ('"+nombre+"','"+genero+"',"+fecha+","+cedula+","+equipo+")";
          consulta=conexion.createStatement();//envia datos
          consulta.executeUpdate(query);   
          
          out.print("<script>alert('REGISTRO GUARDADO');</script>");
     out.print("<META HTTP-EQUIV='REFRESH' CONTENT='0;URL=indexJugador.jsp'>");
       }
       else{
           out.print("<script>    alert('NO HAY CONEXION');</script>");
           out.print("<META HTTP-EQUIV='REFRESH' CONTENT='0;URL=indexJugador.jsp'>");
       }}
     catch(Exception e){
        out.print(e);}
   
%>
    
