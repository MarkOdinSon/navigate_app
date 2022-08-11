My study app.
Intranet is a Wiki-like platform with restricted access.

It consists of a CMS and the main website. 

Language support: English for development environment, Portugal - for production.

-----

Installation algorithm(steps):
1. git clone https://github.com/nickjj/docker-rails-example navigate_app
2. cd navigate_app
3. cp .env.example .env
4. cp docker-compose.override.yml.example docker-compose.override.yml
5. bin/rename-project navigate_app Navigate_app
6. docker-compose up --build
7. ./run rails db:setup
8. go to http://localhost:8000/ and ./run test(may be skipped)
9. add some gems to gemfile(I added Device, Devise Invitable)
10. ./run bundle:install

-----

Device's gem installation algorithm(+
Devise Invitable)

1. gem "devise"; gem "devise_invitable", "~> 2.0.0". (I added them before on 9 step)
2. ./run bundle:install. (I did it before on 10 step)
3. ./run rails g devise:install
4. Open up config/environments/development.rb; config.action_mailer.default_url_options = { host: 'localhost', port: 8000 }
5. Open up app/views/layouts/application.html.erb and add:
<% if notice %>
  <p class="alert alert-success"><%= notice %></p>
<% end %>
<% if alert %>
  <p class="alert alert-danger"><%= alert %></p>
<% end %>
(right above  <%= yield %>)

-

Do you have some problems with devise flash massges?
Rails 7 devise flash messages not being shown?
Try to do the following(Quick fix):
Add :turbo_stream as a navigational format. This line goes in config/initializers/devise.rb. I haven't tested this extensively, but I think it should be fine.

config.navigational_formats = ['*/*', :html, :turbo_stream]

-

6. ./run rails g devise:views
7. ./run rails generate devise User
8. ./run rails db:migrate
9. ./run rails generate devise_invitable:install
10. 
11.
12.

-----

Git init (SSH key must be in your the system and on GitHub account)

1. git init -b main or git init
2. git add .
3. git commit -m "init commit"
4. git remote rm origin
5. git remote add origin git@github.com:MarkOdinSon/navitage_app.git
6. git push -u origin main

-----
