require "sinatra"

set :bind, "0.0.0.0"

def page_content(title)
    File.read("pages/#{title}.txt")
rescue Errno::ENOENT
    return nil
end

get ("/test") do
    erb :test 
end


get ("/") do
    erb :welcome # load from template
end

get "/:title" do
    @title = params[:title]
    @content = page_content(@title)
    erb :show # load template from show.erb
end

