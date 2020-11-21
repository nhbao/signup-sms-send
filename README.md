# README

Run: 

  Bundle:

    bundle install

  DB:

    rake db:migarte

  start jobs:

    rake jobs:work
    
    ruby RAILS_ENV=production bin/delayed_job start
