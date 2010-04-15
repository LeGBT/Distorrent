require 'app/distorrent/download'
require 'app/distorrent/parsexml'
require 'app/distorrent/tlogger'
require "Hpricot"

scheduler = Rufus::Scheduler.start_new

scheduler.every '13m' do
  	HomeController.new.scan
end
