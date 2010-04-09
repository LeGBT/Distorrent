class HomeController < ApplicationController
	def scan
	  @prefs=pref.symbolize_keys[:pref]
		@rss = Rsslist.all
		@nbrss = @rss.length
		@filter = Filterlist.all
		@result = []
		@rss.each {|a|   
		begin
			Dl::down2(a.adress.to_s,"tmp/rss/#{a.id}.xml")				#parcour rss
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
					  puts unparse.link[z]
					lelien=unparse.link[z].gsub(/&lt;/,'<').gsub(/&gt;/,'>').gsub(/&apos;/,'\'').gsub(/&quot;/,'"').gsub(/&amp;/,'&') #correction de l'url
						unless (lelien=="no link") then
							nect = Dl.nectar2(lelien).gsub('/','').gsub(/torrent.*/,'torrent')
						#	puts "nect : #{nect}"
							if (/\.torrent/i.match("#{nect}")) then
								Dl::down2(lelien.to_s,"./tmp/torrents/#{nect}")
							#	puts "#{nect}"
								cmd=pref.symbolize_keys[:pref]["cmd"]
								system("#{cmd} './tmp/torrents/#{nect}'")
								lgg=Loggy.new
      					lgg.push(afilter.name+'  '+afilter.ep.to_s)
								afilter.update_attribute('ep',afilter.ep+1)
								@result.push("#{afilter.name} #{afilter.ep}")
							end				
						else
							puts "gros arg : #{unparse.link[z]}"
						end
					end
				end
			end
		end
		}
	end
	def index
	  @prefs=pref.symbolize_keys[:pref]
		@truc = Rsslist.all
	end
end
