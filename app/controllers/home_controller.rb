class HomeController < ApplicationController
	include Dl
	def scan
		@prefs=pref.symbolize_keys[:pref]
		@rss = Rsslist.all
		@nbrss = @rss.length
		@filter = Filterlist.all
		@result = []
		threads = []
		increm = []
		@rss.each {|a|   
			threads << Thread.new{ 
				begin
					#puts "begining to dl : #{a.adress.to_s}"
					Dl::down2(a.adress.to_s,"tmp/rss/#{a.id}.xml")	
				rescue
					puts $!
				else
					f=File.open("tmp/rss/#{a.id}.xml")
					unparse = Rssread.new(f)
					f.close				
					for z in 0..unparse.total-1 do								#parcour items du rss
						@filter.each do |afilter|								#parcour mes filtres
							@tempreg = "(#{afilter.regexp}[^1-9]*#{afilter.ep})"
							if /#{@tempreg}/xi.match(unparse.title[z]) then
								#puts unparse.link[z]
								lelien=unparse.link[z].gsub(/<!\[CDATA\[/,'').gsub(/\]\]>/,'').gsub(/&lt;/,'<').gsub(/&gt;/,'>').gsub(/&apos;/,'\'').gsub(/&quot;/,'"').gsub(/&amp;/,'&') #correction de l'url
								if lelien.include?("nyaa.eu")
									then
									lelien=lelien.gsub(/torrentinfo/,'download') #correction nyaa
								end
								unless (lelien=="no link") then
									nect = Dl::nectar2(lelien).gsub('/','').gsub(/torrent.*/,'torrent')
									#	puts "nect : #{nect}"
									if (/\.torrent/i.match("#{nect}")) then
										Dl::down2(lelien.to_s,"./tmp/torrents/#{nect}")
										#	puts "#{nect}"
										cmd=pref.symbolize_keys[:pref]["cmd"]
										if RUBY_PLATFORM =~ /mswin32/    then
											system("#{cmd} #{Rails.root}/tmp/torrents/#{nect}")
										else
											system("#{cmd} './tmp/torrents/#{nect}'")
										end
										lgg=Loggy.new
										lgg.push(afilter.name+'  '+afilter.ep.to_s)
										increm.push([afilter.id,afilter.ep])
										@result.push("#{afilter.name} #{afilter.ep}")
									end				
								else
									puts "gros arg : #{unparse.link[z]}"
								end
							end
						end
					end
				#	puts "#{a.adress.to_s} computed"
				end
			}
		} 
		threads.each { |aThread|  aThread.join }
		increm.uniq.each{|a| Filterlist.find(a[0]).update_attribute('ep', a[1]+1) }
	end
	def index
		@prefs=pref.symbolize_keys[:pref]
		@truc = Rsslist.all
	end
end
