# Setup

  	# Install git
  	# Install ruby 2.3.0 through rvm or rbenv
  	# Install rails gem version 4.2.5.1
  	# Install bundler gem
  	# Install mysql

##### You can follow guide here for specific OS

  	http://installrails.com/
  	
##### Copy config template files

Database config and replace corresponding values on the current setup:
	
	config/database.yml.template -> config/database.yml

##### Rails secrets config

Rails secrets config and generate new secrets and replace the secret_key_base value:
	
	config/secrets.yml.template -> config/secrets.yml
	
	Run:
		bundle exec rake secret
	and copy value and replace secret_key_base value
# Run

Once done installing requirements run the following

  	# git clone https://github.com/rewin0087/restaurant_reservation.git
  	# git checkout master
  	# bundle install
  	# bundle exec rake db:create
  	# bundle exec rake db:migrate
  	# rails server

To run test

  	# bundle exec rspec