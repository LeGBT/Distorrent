# encoding: utf-8



class Rssread
	attr_reader	:title, :link
	def total
		#puts parse.channel.title.inspect #each {|i| puts i.inspect}
		unless (parse==nil) then
			@total= parse.channel.item.count
		else
			@total=0
		end
	end
	
	def initialize(file)
		begin
			@parse = XMLObject.new(file)
			#parse.channel.item.each {|i| puts i.inspect}
			@title = parse.channel.item.collect {|i| i.title}
			@link = parse.channel.item.collect {|i| 
			begin
				i.link
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
	#unx = XMLObject.new(File.open('3.xml'))
	#puts unx.channel.item[5].title
	#puts unx.channel.item[5].link

