<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <title>Posts</title>
</head>

<body style='background: linear-gradient(to right, #c31432, #240b36);'>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <a class="navbar-brand" href="#" style="font-weight:bold;">BLOGY</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
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
    <div class="container" style='padding: 0 5em;'>
        
        <%@ page import="java.sql.*" %>
            <%
            try{
            Class.forName("com.mysql.jdbc.Driver");
            java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/blog","root","");
            Statement stmt= con.createStatement();
            ResultSet rs=stmt.executeQuery("select * from posts");
                while(rs.next()) {
                    out.println("<a href='postdetails.jsp?postid="+rs.getInt(1)+"' style='text-decoration:None;color:black;'><div class='card' style='padding:1em;margin:1em;background-color:rgba(250, 244, 244, 0.9);'>");
                    out.println("<h4 class='post-title card-title' style='font-weight:bold'>"+rs.getString(2).toUpperCase()+"</h4>"+"<div style='padding:1em 1em;margin:1em em;background-color: rgba(243, 243, 243,0.8);border-radius:15px;'><h6 class='card-subtitle mb-2'><span style='color:black;font-weight:bold'>GENRE : </span>"+rs.getString(5)+"</h6>"+"<div><h6 class='card-subtitle mb-2'><span style='color:black;font-weight:bold'>BLOGY : </span>"+rs.getString(4)+"<span style='float:right'>"+rs.getString(6)+"</span></h6></div></div>");
                    out.println("</div></a>");
                }
            } 
            catch (Exception e)
                {
                out.println("<html><body><h4>Invalid credentials!</h3></body></html>");
            }
        %>
    </div>
</body>

</html>

<style>

    ::-webkit-scrollbar {
    width: 10px;
    }
    ::-webkit-scrollbar-track {
    background: #f1f1f1;
    }
    ::-webkit-scrollbar-thumb {
    background: #888;
    }
    ::-webkit-scrollbar-thumb:hover {
    background: #555;
    }
    </style>