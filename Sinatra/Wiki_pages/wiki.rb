require "sinatra"

set :bind, "0.0.0.0"

def page_content(title)
    File.read("pages/#{title}.txt")
rescue Errno::ENOENT
    return nil
end



get("/") do
    erb :welcome # load from template
end