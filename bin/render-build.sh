#!/usr/bin/env bash
# exit on error
set -o errexit

bundle install
# bundle exec rake assets:precompile - used to compile and pre-process assets such as stylesheets and JavaScript files for production use
# bundle exec rake assets:clean - used to remove previously generated compiled assets
bundle exec rake db:migrate