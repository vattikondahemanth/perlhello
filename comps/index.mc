<html>
   <head>
     <link rel="stylesheet" href="/static/css/blog.css">
     <title>My Blog: Home</title>
   </head>
   <body>
   
     <h2>Welcome to my blog.</h2>
	 Hello world! The local time is <% scalar(localtime) %>.

	<& all_articles.mi &>
	
    <a href="/new_article">Add an article</a>

  </body>
</html>