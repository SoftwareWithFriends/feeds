#!/usr/bin/env rake
# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Feeds::Application.load_tasks

desc "This task is called by the Heroku cron add-on"
task :cron => :environment do
  Subscription.enqueue_all_update_jobs
end
