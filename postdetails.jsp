<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
        integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <title>Post Details</title>
</head>

<body
    style="background-image: linear-gradient(to right, #ff8177 0%, #ff867a 0%, #ff8c7f 21%, #f99185 52%, #cf556c 78%, #b12a5b 100%);">
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <a class="navbar-brand" href="#" style="font-weight:bold;">BLOGY</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item">
                    <a class="nav-link" href="posts.jsp">HOME</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="create.jsp">NEW POST</a>
                </li>
            </ul>
            <div class="form-inline my-2 my-lg-0">
                <%
                    String name = (String)session.getAttribute("username");
                    if(name==null){
                        out.println("<a href='login.html'><button class='btn btn-outline-light my-2 my-sm-0' type='submit'style='margin-right:1em;'>LOGIN</button></a><a href='signup.html'><button class='btn btn-outline-light my-2 my-sm-0' type='submit'>SIGN UP</button></a>");   
                    }else{
                        out.println("<a href='logout.jsp'><button class='btn btn-outline-light my-2 my-sm-0' type='submit' style='margin-right:1em;'>LOGOUT</button></a>");
                    }
                %>
            </div>
        </div>
    </nav>
    <%@ page import="java.sql.*" %>
    <%@ page import = "javax.servlet.RequestDispatcher" %>
    <% 
        try{
            Class.forName("com.mysql.jdbc.Driver");
            java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/blog","root","");
            Statement stmt= con.createStatement();
            int postID = Integer.parseInt(request.getParameter("postid"));

            String snattbr=(String)session.getAttribute("username");
            
            
            if(snattbr==null){
                out.println("<div class='container' style='margin-top: 2em;'><div class='jumbotron'><h1>Tresspassers are not allowed Bazingaa !</h1><a href='login.html'> <button class='btn btn-danger'> Go to login page </button></a></div></div>");
        
           }else{
            ResultSet rs = stmt.executeQuery("select * from posts where id="+postID);
            if(rs.next()){
                String[] parts = snattbr.split("@");
                String author=parts[0];
                out.println("<div class='card' style='margin:5em;margin-left:10em;margin-right:10em;padding:2em;background-color:#f1faee;'>");
                out.println("<div class='card-title' style='font-weight: 700;font-size:2em;text-align:center;'>"+rs.getString(2).toUpperCase()+"</div><div style='color:black;font-size: 1.15em;margin-bottom: 1em;'><span style='color:black;font-weight: 600;'>GENRE: </span>"+rs.getString(5)+"</div><div class='card-text' style='text-align: justify;padding: 0 1em;margin-bottom: 1em;'>"+rs.getString(3)+"</div><div><h5 class='card-subtitle mb-2 text-muted'><span style='float:right;font-size:0.8em;'>"+rs.getString(6)+"</span></h5></div>"+"<div style='padding-top:1em;'><h5 class='card-subtitle mb-2 text-muted'><span style='float:right;font-size: 0.8em;'>by: "+rs.getString(4)+"</span></h5></div>");
                    if(author.equals(rs.getString(4))){
                        out.println("<div style='flex-direction: row;justify-content: center;width:100%;'><a href='delete.jsp?id="+postID+"'><button class='btn btn-outline-danger btn-sm' type='submit'>Delete</button></a><a href='update.jsp?id="+postID+"' style='margin-left: 2em;'><button class='btn btn-outline-warning btn-sm' type='submit'>Update</button></a><div></div>");
                    }
            }
         }
        }catch(Exception e){
                out.println(e.getMessage());
            }
   %>
</body>

</html>