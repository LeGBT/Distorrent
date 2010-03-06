scheduler = Rufus::Scheduler.start_new


scheduler.every '13m' do
  	HomeController.new.scan
end
