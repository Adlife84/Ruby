require "sinatra"

set :bind, "0.0.0.0"


get("/") do
    "Here's a root directory"
end

get("/apple") do
    "Here's a juice apple"
end

get("/123") do
    "Here's a juice apple"
end

