###
# Compass
###

# Susy grids in Compass
# First: gem install susy --pre
# require 'susy'

# Other modules we'd like to include:
require 'animation'

# Change Compass configuration
# compass_config do |config|
#   config.output_style = :compact
# end

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
# page "/path/to/file.html", :layout => false
#
# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout
#
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# Proxy (fake) files
# page "/this-page-has-no-template.html", :proxy => "/template-file.html" do
#   @which_fake_page = "Rendering a fake page with a variable"
# end

# Homepage related routes (single page multi-view site)
page "/index.html"
page "/contactus/index.html", :proxy => "/index.html"
page "/team/index.html", :proxy => "/index.html"

# presentation routing, not sure if this is the best way
page "/presentation/index.html", :proxy => "/index.html"
(0..15).each do |x|
  page "/presentation/#{x}", :proxy => "/index.html"
end

# 404 page, has no layout to avoid the JS router and such
page "/404.html", :layout => false

###
# Helpers
###

# Automatic image dimensions on image_tag helper
activate :automatic_image_sizes

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

set :css_dir, 'stylesheets'

set :js_dir, 'javascripts'

set :images_dir, 'images'

set :js_assets_paths, %w(vendor)

###
# Other modules
###

# Handlebars
require './lib/handlebars'
activate :handlebars

# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  activate :minify_css

  # Minify Javascript on build
  activate :minify_javascript

  # Enable cache buster
  # activate :cache_buster

  # Use relative URLs
  activate :relative_assets

  # Compress PNGs after build
  # First: gem install middleman-smusher
  require "middleman-smusher"
  activate :smusher

  # Or use a different image path
  # set :http_path, "/Content/images/"

  # Consider one day to gzip and serve with gzip_static on nginx
  # activate :gzip

  # Generate favicons of various sizes from favicon_base.png (114px sq)
  activate :favicon_maker
end
