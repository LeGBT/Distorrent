class Loggy
  attr_reader	:lastdls
  def initialize
    unless File.exist?("#{RAILS_ROOT}/tmp/Logs/lastdls")
      File.new("#{RAILS_ROOT}/tmp/Logs/lastdls",'w')
    end
    f=File.open("#{RAILS_ROOT}/tmp/Logs/lastdls")
		a=f.readlines.collect{|l| l}
		@lastdls=a[[-a.length,-20].max,10]
    f.close
  end
  def push(line)
    f=File.open("#{RAILS_ROOT}/tmp/Logs/lastdls",'a')
    t=Time.now
    time=t.day.to_s+'/'+t.month.to_s+'/'+t.year.to_s+' '+t.hour.to_s+':'+t.min.to_s+':'+t.sec.to_s+"   "
    f.puts(time+line)
    f.close
  end
end