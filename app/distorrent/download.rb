


module Dl

	
	def Dl.nectar2(url_str, limit = 20)
		if limit ==0 then raise "Nectar limit reached with : #{url_str} " end
		begin
			url_str =  URI.escape(url_str,"[]") 
			clnt = HTTPClient.new
			clnt.connect_timeout = 10
			#puts "#{url_str} en dl..."
			theget = clnt.get(url_str)
			#puts "#{url_str} dl fini !"
			if HTTP::Status::redirect?(clnt.head(url_str).status_code) then
				puts "redirect : #{theget.header['location'][0]}"
				nectar2(theget.header['location'][0], limit-1)
			else
				if HTTP::Status::successful?(theget.status) and (theget.header['Content-Type'][0] =~ /application.*/) then
					if theget.header['Content-Disposition'][0] then
					#	puts "good raw : #{theget.header['Content-Disposition'][0]}"
						return theget.header['Content-Disposition'][0].gsub(/.*filename=\"/,'').gsub(/\"/,'')
						 clnt.reset_all
						#t
					else
					#	puts "louche : #{url_str}"
						clnt.reset_all
						URI.unescape(url_str.to_s.gsub(/.*\//,''))
					end
				else
					raise "Url error not a torrent file :" + theget.header['Content-Type'][0].to_str
				end
			end
		rescue 
			puts "nectar error with #{url_str} : "+$!.to_s
			"no link"
		end	
	end
	
	def Dl.down2(url_str,where)
		begin
			clnt = HTTPClient.new
			clnt.connect_timeout = 5
			url_str = URI.escape(url_str,"[]")
			#puts "#{url_str} en dl..."
			theget = clnt.get(url_str)
			#puts "#{url_str} dl fini !"
			if theget.status.to_i < 400 then 
				contet = clnt.get_content(url_str)
				open(where, "wb") { |files|
 				files.write(contet)}
 			else puts theget.status
 			end
 			clnt.reset_all
 		rescue 
 			raise "Dl error with #{url_str} : "+ $!.to_s
 		end	
	end
end
