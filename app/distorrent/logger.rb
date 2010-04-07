class Loggy
  attr_reader	:lastdls
  def intitialize
    unless File('./tmp/Logs/lastdls').exist?
      File.new('./tmp/Logs/lastdls','w')
    end
    f=File.open('./tmp/Logs/lastdls')
    @lastdls=f.readlines[-10..-1]
    f.close
  end
  def push(line)
    f=File.open('./tmp/Logs/lastdls','a')
    f.puts(Time.now.to_s+'   '+line)
    f.close
  end
end