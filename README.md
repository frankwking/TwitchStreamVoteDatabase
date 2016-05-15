# TwitchStreamVoteDatabase
A database for tracking a queue of games to be played.

For some reason rack wasn't working when included in the gem file.  If bundle install doesn't get a working rackup, then run 'gem install rack'

## Workflow:
1. rake db:setup             <- Setup database
2. db:migrate                <- Perform any necessary migrations
3. bundle exec rackup -p4567 <- Setup the server
4. localhost:4567            <- Access in the web browser