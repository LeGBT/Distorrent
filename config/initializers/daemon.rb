require "#{Rails.root}/app/distorrent/download"
require "#{Rails.root}/app/distorrent/parsexml"
require "#{Rails.root}/app/distorrent/tlogger"
require "Hpricot" #looks like this line is needed because of the threading in homecontroler

  	HomeController.new.scan

scheduler = Rufus::Scheduler.start_new

scheduler.every '13m' do
  	HomeController.new.scan
end
