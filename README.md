# README

Steps to get the project running.

* Open terminal in the project directory and run bindle install.

* Modify the mail_room_config.yml to include your gmail username and password.

* Open the config/environments/production.rb and config/environments/development.rb and change the Gmail smtp setting to include your gmail username and password.

* Start the mail_room server by running: "mail_room -c ./mail_room_config.yml".

* Open up other terminal in the project directory and start the rails server by running "rails s".

* OPen the browser and go to "http://localhost:3000". This is where the welcome screen will appear.

* The mail_room server will forward all the incoming emails from gmail to the rails server.