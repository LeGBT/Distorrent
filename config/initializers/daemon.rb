require 'app/distorrent/download'
require 'app/distorrent/parsexml'
require 'app/distorrent/tlogger'
require "Hpricot" #looks like this line is needed because of the threading in homecontroler

scheduler = Rufus::Scheduler.start_new

scheduler.every '13m' do
  	HomeController.new.scan
end
