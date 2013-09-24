<!doctype html>
<html>
  <head>
    <meta charset="utf-8" />
    <meta http-equiv='X-UA-Compatible' content='IE=edge;chrome=1' />
  </head>
  <body>

    <div id="main" role="main">
      <%= yield %>
    </div>

    <aside>
      <h2>Recent Articles</h2>
      <ol>
        <% blog.articles[0...10].each do |article| %>
          <li><%= link_to article.title, article %> <span><%= article.date.strftime('%b %e') %></span></li>
        <% end %>
      </ol>

      <h2>Tags</h2>
      <ol>
        <% blog.tags.each do |tag, articles| %>
          <li><%= link_to tag, tag_path(tag) %> (<%= articles.size %>)</a></li>
        <% end %>
      </ol>

      <h2>By Year</h2>
      <ol>
        <% blog.articles.group_by {|a| a.date.year }.each do |year, articles| %>
          <li><%= link_to year, blog_year_path(year) %> (<%= articles.size %>)</a></li>
        <% end %>
      </ol>
    </aside>
  </body>
</html>
