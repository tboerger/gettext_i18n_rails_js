# -*- coding: UTF-8 -*-
#
# Copyright (c) 2012-2015 Dropmysite.com <https://dropmyemail.com>
# Copyright (c) 2015 Webhippie <http://www.webhippie.de>
#
# Permission is hereby granted, free of charge, to any person obtaining
# a copy of this software and associated documentation files (the
# "Software"), to deal in the Software without restriction, including
# without limitation the rights to use, copy, modify, merge, publish,
# distribute, sublicense, and/or sell copies of the Software, and to
# permit persons to whom the Software is furnished to do so, subject to
# the following conditions:
#
# The above copyright notice and this permission notice shall be
# included in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
# LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
# OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
# WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
#

source "http://rubygems.org"
gemspec

gem "rails", "~> #{ENV["RAILS_VERSION"]}" if ENV["RAILS_VERSION"]

group :development do
  gem "guard", require: false
  gem "guard-rspec", require: false
  gem "guard-rubocop", require: false

  # Temporary fix for a ruby 2.2 requirement
  gem "listen", "~> 3.0.7"
end

group :test do
  gem "codeclimate-test-reporter", require: false
  gem "rubocop", require: false
  gem "simplecov", require: false
end

instance_eval(File.read("Gemfile.local")) if File.exist? "Gemfile.local"
