# README

## Introduction ## 

Our team is building a web application for Breaking Barriers, an organization based out of Houston
that lets their members sign up for recurring volunteer events. The application will allow users to
view upcoming/past volunteer events and sign up for them. Members will receive an email confirmation when
they're confirmed by an officer to attend an event. They can also see the total number of hours they've 
accumulated from attending events.
The organization officers will be granted administrator access to the application, which will allow them 
to create custom events, view the members' hours, and export data associated with users, events, and hours. 
We've also added an Announcements page that all users can access. Officers can create posts/announcements, 
and members will have the ability to add comments to the announcements. This will allow the organization to
communicate with one another and keep everyone updated on the latest news.

## Requirements ##

This code has been run and tested on: 

- Ruby - 3.0.2p107
- Rails - 6.1.4.1
- Ruby Gems - Listed in 'Gemfile'
- PostgreSQL - 13.3
- Node.js - 16.9.1
- Yarn - 1.22.11
- Docker (Latest Container)

## External Deps

- Docker - Download latest version at https://www.docker.com/products/docker-desktop
- Heroku CLI - Download latest version at https://devcenter.heroku.com/articles/heroku-cli
- Git - Downloat latest version at https://git-scm.com/book/en/v2/Getting-Started-Installing-Git
- GitHub Desktop (Not needed, but HELPFUL) at https://desktop.github.com/

## Installation

Download this code repository by using git:

`git clone https://github.com/FA21-CSCE431/project-sprint-3-zlp-interviewer.git`
 or 
 `git clone https://github.com/FA21-CSCE431/project-final-code-zlp-interviewer/`

## Tests

An RSpec test suite is available and can be ran using:

`rspec spec/`

You can run all the test cases by running. This will run both the unit and integration tests.
`rspec .`

## Execute Code

Run the following code in Powershell if using windows or the terminal using Linux/Mac

`cd project-sprint-3-zlp-interviewer`

`docker run --rm -it --volume "$(pwd):/rails_app" -e DATABASE_USER=test_app -e DATABASE_PASSWORD=test_password -p 3000:3000 dmartinez05/ruby_rails_postgresql:latest`


Install the app

`bundle install && rails webpacker:install && rails db:create && db:migrate`


Run the app
`rails server --binding:0.0.0.0`


The application can be seen using a browser and navigating to http://localhost:3000/

