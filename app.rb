require "sinatra"
require "sinatra/reloader"
require "http"

get("/") do
 api_url = "https://api.adviceslip.com/advice"

@raw_response = HTTP.get(api_url)
@raw_string = @raw_response.to_s
@parsed_data = JSON.parse(@raw_string)
@slip = @parsed_data.fetch("slip")
@advice = @slip.fetch("advice")


erb(:homepage)
end
