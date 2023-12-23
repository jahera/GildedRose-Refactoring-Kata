assessments:
Gilded Rose system according to the specified requirements.
https://github.com/jahera/GildedRose-Refactoring-Kata/blob/main/GildedRoseRequirements.md

used:
sinatra

Ruby verions:
ruby-3.0.0

Database: 
postgresql

Follow by step:
1. Install ruby with verion
2. Enter project
3. Bundle Install
4. rake db:create
5. rake db;migrate
6. rake db:seed
7. ruby app.rb

RSpec test case for the Gilded Rose system:
Step-1:

gem 'rack-test'
gem 'rspec'

Step-2

Create a spec/spec_helper.rb file for configuring RSpec.

Create a test file spec/app_spec.rb.

Step-3:

rake db:create RACK_ENV=test
rake db:migrate RACK_ENV=test

Step-4:
rspec spec RACK_ENV=test