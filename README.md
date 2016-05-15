# TwitchStreamVoteDatabase
A database for tracking a queue of games to be played.

For some reason rack wasn't working when included in the gem file.  If bundle install doesn't get a working rackup, then run 'gem install rack'

## Database/server setup
1. rm data.sqlite3           <- Remove db (if it exists)
2. db:migrate                <- Perform migrations
3. rake db:setup             <- Setup database
4. bundle exec rackup -p4567 <- Setup the server
5. localhost:4567            <- Access in the web browser