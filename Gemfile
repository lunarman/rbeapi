source ENV['GEM_SOURCE'] || 'https://rubygems.org'

gem 'net_http_unix'
gem 'inifile'

group :development do
  gem 'guard'
  gem 'guard-rspec'
  gem 'guard-rubocop'
  gem 'guard-shell'
end

group :development, :test do
  gem 'rake', '~> 10.1.0'
  gem 'rspec', '~> 3.0.0'
  gem 'rspec-mocks', '~> 3.0.0'
  gem 'simplecov'
  gem 'yard'
  gem 'redcarpet', '~> 3.1.2'
  gem 'pry',                     require: false
  gem 'pry-doc',                 require: false
  gem 'pry-stack_explorer',      require: false
end

# vim:ft=ruby
