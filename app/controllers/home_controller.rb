class HomeController < ApplicationController
	def scan
		@rss = Rsslist.all
		@nbrss = @rss.count
		@filter = Filterlist.all
		@result = []
		@rss.each {|a|   
		begin
			Dl::down2(a.adress.to_s,"tmp/rss/#{a.id}.xml")				#parcour rss
		rescue
			puts $!	
		else
			unparse = Rssread.new(File.open("tmp/rss/#{a.id}.xml"))				
			for z in 0..unparse.total-1 do								#parcour items du rss
				@filter.each do |afilter|								#parcour mes filtres
					@tempreg = "(#{afilter.regexp}[^1-9]*#{afilter.ep})"
					if /#{@tempreg}/xi.match(unparse.title[z]) then
					lelien=unparse.link[z].gsub(/&lt;/,'<').gsub(/&gt;/,'>').gsub(/&apos;/,'\'').gsub(/&quot;/,'"').gsub(/&amp;/,'&') #correction de l'url
						unless (lelien=="no link") then
							nect = Dl.nectar2(lelien)
							puts "nect : #{nect}"
							if (/\.torrent/i.match("#{nect}")) then
								Dl::down2(lelien.to_s,"#{nect}")
								puts "#{nect}"
								system("open '#{nect}'")
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
	
	def delamerde
		puts "erf"
	end
	
	def index
		@truc = Rsslist.all
	end
	
end
