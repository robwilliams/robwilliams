###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

# With alternative layout
# page "/path/to/file.html", layout: :otherlayout

# Proxy pages (http://middlemanapp.com/basics/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", locals: {
#  which_fake_page: "Rendering a fake page with a local variable" }

# General configuration

# Reload the browser automatically whenever files change
configure :development do
  activate :livereload
end

###
# Helpers
###

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

# Build-specific configuration
configure :build do
  # Minify CSS on build
  #activate :minify_css

  # Minify Javascript on build
  #activate :minify_javascript
end

activate :s3_sync do |config|
  config.bucket                 = 'robwillia.ms'
  config.region                 = 'eu-west-1'
  config.aws_access_key_id      = ENV.fetch('AWS_ACCESS_KEY')
  config.aws_secret_access_key  = ENV.fetch('AWS_ACCESS_SECRET')
  config.after_build            = true
end
