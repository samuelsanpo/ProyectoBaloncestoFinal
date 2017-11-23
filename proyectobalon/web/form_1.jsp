<%@page import="java.sql.*"%>
 <%
 String url,query;
 String nombre,color;
 int entrenador,torneo ;
  Connection conexion=null; 
   Statement consulta=null;
   ResultSet resultado=null;
try{
       Class.forName("com.mysql.jdbc.Driver").newInstance(); 
       url="jdbc:mysql://localhost/balonbases";
       conexion=DriverManager.getConnection(url,"root","Online123");
       if(conexion!=null){
         nombre=request.getParameter("equiponombre");
         color=request.getParameter("colorequipo");
         entrenador=Integer.parseInt(request.getParameter("Entrenador"));
         torneo=Integer.parseInt(request.getParameter("Torneo")); 
        
       
query="insert into equipo (nombre,color,ID_entrenador,ID_torneo)values ('"+nombre+"','"+color+"',"+entrenador+","+torneo+")";
          consulta=conexion.createStatement();//envia datos
          consulta.executeUpdate(query);   
          
          out.print("<script>alert('REGISTRO GUARDADO');</script>");
     out.print("<META HTTP-EQUIV='REFRESH' CONTENT='0;URL=indexEquipo.jsp'>");
       }
       else{
           out.print("<script>    alert('NO HAY CONEXION');</script>");
           out.print("<META HTTP-EQUIV='REFRESH' CONTENT='0;URL=indexEquipo.jsp'>");
       }}
     catch(Exception e){
        out.print(e);}
   
%>
    
