<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
        integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <title>Update</title>
</head>

<body style='background: linear-gradient(to right, #654ea3, #eaafc8);'>
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
    
    <div class="container" style="margin-top: 2em;">
    <%@ page import="java.sql.*" %>
    <%
        try{
            Class.forName("com.mysql.jdbc.Driver");
            java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/blog","root","");
            Statement stmt= con.createStatement();

            int id=Integer.parseInt(request.getParameter("id"));
            ResultSet res = stmt.executeQuery("select * from posts where id="+id);            
            
            if(res.next()){
                out.println("<form action='updatepost.jsp' method='POST'><div class='jumbotron'><h1 style='text-align:center'>Update your blog</h1><div class='form-group'><label for='title'>Title</label><input type='text' class='form-control' id='title' name='title' value='"+res.getString(2)+"'></div> <div class='form-group'><label for='Desc'>Description</label>  <textarea type='text' class='form-control' id='desc' name='desc' rows='3' >"+res.getString(3)+"</textarea> </div> <div class=' form-group'>  <label for='genre '>Genre</label><input type='text ' class='form-control' id='gene' name='gene' value='"+res.getString(5)+"'><input type='hidden' class='form-control' id='datepick' name='date'><input type='hidden' class='form-control' id='id' name='id' value='"+id+"'></div><center><button type='submit' class='btn btn-success btn-lg'>UPDATE</button></center></div></form>");
            }else{
                out.println("<div class='jumbotron'><h1>Post Not Found</h1><a href='posts.html'><button class='btn btn-danger'>Go to Home Page</button></a></div>");
            }

        }catch(Exception e){
            out.println(e.getMessage());
        }
    %>
</div>

</body>

</html>