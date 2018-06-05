Rapport
================

This application was generated with the [rails_apps_composer](https://github.com/RailsApps/rails_apps_composer) gem
provided by the [RailsApps Project](http://railsapps.github.io/).

Rails Composer is supported by developers who purchase our RailsApps tutorials.

Problems? Issues?
-----------

Need help? Ask on Stack Overflow with the tag 'railsapps.'

Your application contains diagnostics in the README file. Please provide a copy of the README file when reporting any issues.

If the application doesn't work as expected, please [report an issue](https://github.com/RailsApps/rails_apps_composer/issues)
and include the diagnostics.

Ruby on Rails
-------------

This application requires:

- Ruby 2.3.3
- Rails 5.1.4
- pg >= 0.18

Learn more about [Installing Rails](http://railsapps.github.io/installing-rails.html).

Getting Started
---------------

Make sure your development environment supports the above requirements.

### Run locally

#### Set up a postgreSQL database on your workspace  

$ sudo service postgresql start

$ sudo sudo -u postgres psql

postgres=# CREATE USER username SUPERUSER PASSWORD 'password';

CREATE ROLE

postgres=# \q

#### Create some local variables and save some values to them 

$ echo "export USERNAME=username" >> ~/.profile

$ echo "export PASSWORD=password" >> ~/.profile

Restart terminal so that the environment variables are set.

#### Set up local email server

In project root:

$ touch .env

Copy the text below, paste it in .env and fill in your email and password.

RAILS_ENV=development
MAILER_USERNAME= < your email (has to be a gmail address) >
MAILER_PASSWORD= < your password >

#### Set up the rails application

$ bundle install
$ rake db:create
$ rake db:migrate

#### Run the application

$ rails server

Production
------------

This application is deployed to heroku, contact me to get access Västgöta Nation's heroku server.

[![Deploy to Heroku](https://www.herokucdn.com/deploy/button.png)](https://heroku.com/deploy)

Documentation and Support
-------------------------

Issues
-------------

Similar Projects
----------------

Contributing
------------

Credits
-------

License
-------
