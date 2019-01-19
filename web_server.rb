require 'webrick'
require './mastodon.rb'

# settings
WEBSERVER_IPADDR = "127.0.0.1"
WEBSERVER_PORT = "10080"
WEBSERVER_MOUNT_POINT = "/"

class MyServlet < WEBrick::HTTPServlet::AbstractServlet
	def do_GET(req, res)
		res = WebServerHandler.get_res(req, res)
	end

	def do_POST(req, res)
		res = WebServerHandler.post_res(req, res)
	end

	def do_PUT(req, res)
		res = WebServerHandler.put_res(req, res)
	end

	def do_DELETE(req, res)
		res = WebServerHandler.delete_res(req, res)
	end
end

class WebServerHandler

	def self.get_res(req,res)
		l = Lunch.new()
		res.content_type = "application/json; charset=utf-8"
		#res.body = "aaaa"
		res.body = '{"day":"' + l.latest["day"].force_encoding("UTF-8") + '","lunch":"' + l.latest["lunch"].force_encoding("UTF-8") + '"}'
	end

end

# main
server = WEBrick::HTTPServer.new({:BindAddress => WEBSERVER_IPADDR, :Port => WEBSERVER_PORT})
server.mount(WEBSERVER_MOUNT_POINT, MyServlet)
Signal.trap(:INT){server.shutdown}
server.start