<html>
# <%class>
# route ":section/{year:[0-9]{4}}/{month:[0-9]{2}}";
# </%class>

<%init>



# Section for <b><% $.section %></b>
# Mysection for <b><% $.mysection %></b>
# For the month of <% $.month %>/<% $.year %>

use URI;
my $url = URI->new($m->req->{'env'}->{'REQUEST_URI'});
my %queryform = $url->query_form('param1');


</%init>



   <head>
     <link rel="stylesheet" href="/static/css/blog.css">
     <title>My Blog: Home</title>
   </head>
   <body>
        url is  <b><% $m->req->{'env'}->{'REQUEST_URI'} %></b>
        <br/>
        param1 is <% %queryform{'param1'} %>
        <br/>
        param2 is <% %queryform{'param2'} %>
        <br/>
        param3 is <% %queryform{'param3'} %>
        <br/>
        <a href="/">Back to Home</a>
    </body>
</html>

