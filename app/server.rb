# hello.rb

require 'sinatra'

set :bind, '0.0.0.0'  # Allows external access
set :port, 4567       # Ensure it's running on port 4567


get '/' do
  'Hello Francklin!'
end