class Loggy
  attr_reader	:lastdls
  def initialize
    unless File.exist?("#{Rails.root}/tmp/Logs/lastdls")
     # File.new("#{RAILS_ROOT}/tmp/Logs/lastdls",'w')
      f=File.open("#{Rails.root}/tmp/Logs/lastdls",'a')
      f.puts("Lasts Dls were :")
      f.close
    end
    f=File.open("#{Rails.root}/tmp/Logs/lastdls")
		a=f.readlines.collect{|l| l}
		@lastdls=a[[-a.length,-10].max,10]
		#@lastdls=a[1,10].reverse
    f.close
  end
  def push(line)
    f=File.open("#{Rails.root}/tmp/Logs/lastdls",'a')
    t=Time.now
    time=t.day.to_s+'/'+t.month.to_s+'/'+t.year.to_s+' '+t.hour.to_s+':'+t.min.to_s+':'+t.sec.to_s
    f.puts(time+line)
    f.close
  end
end
