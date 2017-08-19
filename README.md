README

Medium: Photogur Project

This project will create a clone of Imgur called Photogur. It allows users to re-post images they find online.

Let’s start a new app.

$ rails new photogur $ cd photogur We want an app to manage Pictures, so let’s generate a scaffold for it and migrate.

$ rails g scaffold Picture title url --javascript-engine=js --stylesheet-engine=css $ rake db:migrate When we run the server, we get the scaffold we expect at http://localhost:3000/pictures. Let’s create a picture with a URL:

image alt text

I used Chrome Developer tools to grab the URL to the Wyncode logo from the Wyncode site. But there’s a problem.

image alt text

When I display the picture, I see the URL rather than the image. I need to use an image tag in the show view. So let’s fix that.

In app/views/pictures/show.html.erb

<%= notice %>

Title: <%= @picture.title %>

<%= image_tag @picture.url %>

<%= link_to 'Edit', edit_picture_path(@picture) %> | <%= link_to 'Back', pictures_path %> My edits (in bold) removed the URL header and replaced the URL text with an image_tag. The image_tag method is a "view helper", a method that helps you generate HTML code. You could have accomplished the same thing using this line of code instead:



But, in this case, the result is slightly more code for slightly less HTML. The image_tag helper produces this HTML:
Logo wyncode1

While writing HTML manually produces this:


Letting Rails handle HTML-generation allows Rails to, for example, add an alt attribute to make your page more accessible. If more accessibility tags are recommended in the future (e.g. https://developer.mozilla.org/en-US/docs/Web/Accessibility/ARIA), Rails will automatically add them for you if you use their helpers. Otherwise you have to do it yourself. So using the view helpers is recommended.
With this change to the show view, our Picture page looks better.

image alt text

But the index page is still showing text URLs.

image alt text

So we need to update the index view as well.

In app/views/pictures/index.html.erb

Listing pictures

<% @pictures.each do |picture| %> <% end %>
Title	Url	
<%= picture.title %>	<%= image_tag picture.url %>	<%= link_to 'Show', picture %>	<%= link_to 'Edit', edit_picture_path(picture) %>	<%= link_to 'Destroy', picture, method: :delete, data: { confirm: 'Are you sure?' } %>
<%= link_to 'New Picture', new_picture_path %> My edit (in bold) changes the text URL to an image_tag. Now my Picture list is working.
image alt text

And that’s all you need to create your own photo hosting site. Obviously we’re cheating a bit here because we’re not allowing users to upload their own photos. We’re just displaying photos uploaded elsewhere. But this app gives you a great platform for coming up with some fancy designs or jQuery picture viewing effects. So have fun with it.
