<html>
   <head>
     <link rel="stylesheet" href="/static/css/blog.css">
     <title>My Blog: Home</title>
   </head>
   <body>
     <h2>This is article Page</h2>
	 <form action="publish" type="POST">
      <input type="text" id="content" class="fadeIn second" name="content" placeholder="login">
      <input type="text" id="title" class="fadeIn third" name="title" placeholder="password">
      <input type="submit" class="fadeIn fourth" value="Log In">
	  <br />
	  <br />
	  <a href="/">Back to Home</a>
	  <br />
	  <br />
	  <% $m -> req -> session -> {message} %>
    </form>
    
  </body>
</html>