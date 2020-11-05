require "sinatra"
require "uri"

set :bind, "0.0.0.0"

def page_content(title)
    File.read("pages/#{title}.txt")
rescue Errno::ENOENT
    return nil
end

# Save title, content from argument to file /pages/title.txt 
def save_content(title, content)
    File.open("pages/#{title}.txt", "w") do |file| # title as argument
        file.print(content) # content as a string puts on the file
    end
end

get ("/test") do
    erb :test 
end


get ("/") do
    erb :welcome # load from template
end

get ("/new") do
    erb :new # load from template
end


post ("/create") do
    "Hello from '/create' route!"
    #params.inspect  - returns {"title"=>"asdas", "content"=>"asdadsasd"}
    save_content(params["title"], params["content"])
    redirect URI.escape("/#{params["title"]}")
end




# This route have to be in the end becouse it can take any parameters from URL
get "/:title" do
    @title = params[:title]
    @content = page_content(@title)
    erb :show # load template from show.erb
end
