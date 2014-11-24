###
# Blog settings
###

# Directory Conventions

set :css_dir, 'stylesheets'
set :js_dir, 'js'
set :images_dir, 'img'
set :partials_dir, 'partials'

# Autoprefixer
activate :autoprefixer do |config|
  config.browsers = ['last 2 versions', 'Explorer >= 9']
end

# Use Haml
set :haml, { ugly: true, format: :html5 }

Time.zone = "US/Eastern"

activate :blog do |blog|
  blog.new_article_template = "source/generator/article.haml.erb"
  blog.sources = "articles/{title}.html"
  blog.permalink = "{title}.html"
  blog.taglink = "on/{tag}.html"
  blog.layout = "articles"
  blog.default_extension = ".haml"
end

page "/feed.xml", layout: false

configure :build do
  activate :minify_css
  activate :minify_javascript
  activate :directory_indexes
end

# Deployer
activate :deploy do |deploy|
  deploy.method = :git
end
