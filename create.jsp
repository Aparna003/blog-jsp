<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <title>Creating Post</title>
</head>
<script>
    document.getElementById('datepick').value = new Date().toString();
</script>

<body style='background: linear-gradient(to right, #654ea3, #eaafc8);'>
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

    <div class="container" style="margin-top: 5em;padding:0 7em;">
        <%
                    String newname = (String)session.getAttribute("username");
                    if(newname==null){
                        out.println("<div class='jumbotron' ><h1>Login to add post!</h1><a href='login.html'><button class='btn btn-danger'>Go to Login Page</button></a></div>");
                    }else{
                        out.println("<form action='postcreate.jsp' method='POST'><div class='jumbotron' style='background-color:rgba(243,243,243,0.6)'><h1 style='text-align:center;font-weight:600 ;font-family: Georgia;'>ADD YOUR BLOG</h1><div class='form-group' style='margin-top: 2em;'><label for='title' style='font-weight: 600;'>Title</label><input type='text' class='form-control' id='title' name='title'></div> <div class='form-group'><label for='Desc' style='font-weight: 600;'>Description</label>  <input type='text' class='form-control' id='desc' name='desc' height='100px'> </div> <div class=' form-group'>  <label for='genre ' style='font-weight: 600;'>Genre</label><input type='text ' class='form-control' id='gene' name='gene'><input type='hidden' class='form-control' id='datepick' name='date'></div><center><button type='submit' class='btn btn-success btn-lg' >POST</button></center></div></form>");
                    }
                %>
        

    </div>
</body>

</html>