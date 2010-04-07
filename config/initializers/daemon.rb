require 'app/distorrent/download'
require 'app/distorrent/parsexml'
require 'app/distorrent/logger'


scheduler = Rufus::Scheduler.start_new

scheduler.every '13m' do
  	HomeController.new.scan
end
