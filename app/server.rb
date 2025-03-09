require 'sinatra'
get '/' do
    ENV['HELLO_MESSAGE'] || 'hello Francklin!'
end