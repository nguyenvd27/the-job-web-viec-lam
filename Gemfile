source "https://rubygems.org"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


gem "rails", "~> 5.1.6"
gem "puma", "~> 3.12"
gem "sass-rails", "~> 5.0"
gem "uglifier", ">= 1.3.0"
gem "coffee-rails", "~> 4.2"
gem "turbolinks", "~> 5"
gem "jbuilder", "~> 2.5"
gem "font-awesome-rails"
gem "devise"
gem "faker"
gem "awesome_print", require:"ap"
gem "jquery-rails"
gem "bootstrap-sass"
gem "cocoon"
gem "carrierwave"
gem "cloudinary"
gem "ckeditor"
gem "mini_magick", "4.7.0"
gem "kaminari"
gem "ransack"
gem "acts-as-taggable-on"
gem "figaro"

group :development, :test do
  gem "sqlite3", "1.3.13"
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
  gem "capybara", "~> 2.13"
  gem "selenium-webdriver"
end

group :development do
  gem "web-console", ">= 3.3.0"
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
end

group :production do
  # gem "pg", "1.1.4"
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
