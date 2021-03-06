require 'rubygems'
require 'sinatra'

root_dir = File.join(File.expand_path(File.dirname(__FILE__)), ".")

require File.join(root_dir, 'server')

set :environment, :development
set :root,  root_dir
set :app_file, File.join(root_dir, 'server.rb')
disable :run

FileUtils.mkdir_p 'log' unless File.exists?('log')
log = File.new("log/sinatra.log", "a")
$stdout.reopen(log)
$stderr.reopen(log)

run Sinatra::Application