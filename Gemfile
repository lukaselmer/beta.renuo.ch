source 'https://rubygems.org'

ruby File.read('.ruby-version').strip

gem 'jekyll'

group :lint do
  gem 'brakeman', require: false
  gem 'reek', require: false
  gem 'rubocop', require: false
  gem 'scss_lint', require: false
  gem 'slim_lint', require: false
end

eval_gemfile('Gemfile.local.rb') if File.exist?('Gemfile.local.rb')
