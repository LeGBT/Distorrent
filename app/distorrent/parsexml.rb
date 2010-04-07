# encoding: utf-8



class Rssread
	attr_reader	:title, :link
	def total
		#puts parse.channel.title.inspect #each {|i| puts i.inspect}
		unless (parse==nil) then
			@total= (parse/'channel'/'item').length
		else
			@total=0
		end
	end
	
	def initialize(file)
		begin
			@parse = Hpricot::XML(file)
			#parse.channel.item.each {|i| puts i.inspect}
			@title = (parse/'channel'/'item').collect {|i| (i/'title').inner_html}
			@link = (parse/'channel'/'item').collect {|i| 
			begin
			(i/'link').inner_html
			rescue
				"no link"
			end	
			}
		rescue
			puts "wrong rss file:"+$!
			parse = nil
		end
	end
	protected
	def parse
		@parse
	end
end


