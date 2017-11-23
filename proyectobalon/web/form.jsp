<%@page import="java.sql.*"%>
 <%
 String url,query;
 String nombre,lugar;
 int fixture,categoria;
  Connection conexion=null; 
   Statement consulta=null;
   ResultSet resultado=null;
try{
       Class.forName("com.mysql.jdbc.Driver").newInstance(); 
       url="jdbc:mysql://localhost/balonbases";
       conexion=DriverManager.getConnection(url,"root","Online123");
       if(conexion!=null){
         nombre=request.getParameter("torneonombre");
         lugar=request.getParameter("torneolugar");
         categoria=Integer.parseInt(request.getParameter("Categoria"));
         fixture=Integer.parseInt(request.getParameter("Fixture")); 
        
       
query="insert into torneo (nombre,lugar,ID_fixture,ID_categoria)values ('"+nombre+"','"+lugar+"',"+fixture+","+categoria+")";
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
    
