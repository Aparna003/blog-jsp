<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <title>Login</title>
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

    <div class='container' style='margin-top: 2em;'>
        <div class='jumbotron'>
            <%@ page import="java.sql.*" %>
            <%
                try{
                    String user=request.getParameter("uname");
                    String pwd= request.getParameter("pswd");

                    Class.forName("com.mysql.jdbc.Driver");
                    java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/register","root","");
                    Statement stmt= con.createStatement();
                    ResultSet rs=stmt.executeQuery("select * from users where username='"+user+"'");
                    if(rs.next()){
                        if (rs.getString(2).equals(pwd)) {
                            out.println("<h1>User validation successful</h1>");
                            session.setAttribute("username",rs.getString(1));
                        }
                        else{
                            out.println("<h1>Invalid credentials!</h1>");
                        }
                    }else{
                        out.println("<h1>No user found</h1>");
                    }
                }catch (Exception e){
                    out.println("<h1>"+e.getMessage()+"</h1>");
                }finally{

                }

                %>
            <a href='posts.jsp'>
                <button class='btn btn-danger'>
                    Go to Home Page
                </button>
            </a>
    
    </div>
    </div>
</body>

</html>