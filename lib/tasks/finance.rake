desc "master"
require 'yahoo.rb'

task :all => :environment do
  Yahoo.scrape
end