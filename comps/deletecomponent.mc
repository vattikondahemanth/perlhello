<html>


<%class>

route ":section/{year:[0-9]{4}}/{month:[0-9]{2}}/{article_number:[1-9]+}";

</%class>

<body>
        Section for <b><% $.section %></b>
        </br>
        Article Number  for <b><% $.article_number %></b>
        </br>
        For the month of <% $.month %>/<% $.year %>
        </br>
        </br>
        <a href="/">Back to Home</a>
</body>

</html>