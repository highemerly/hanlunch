require 'rubygems'
require 'mastodon'
require 'pp'
require 'time'
require 'date'
require './account.rb'
require './sqlite.rb'

MASTODON_HOST = 'https://handon.club'
MASTODON_ACCOUNT_ID = 1 # Integer
DATABASE_FILENAME = "lunch.db"

TARGET_HASHTAG = "hanlunch" # w/o sharp

class Mstdn
	def initialize()
		@client = Mastodon::REST::Client.new(base_url: MASTODON_HOST, bearer_token: MASTODON_ACCESS_TOKEN)
	end

	def user_timeline(id)
		return @client.statuses(id)
	end
end

class Lunch
	def initialize()
		@mstdn = Mstdn.new()
		@db = Database.new(DATABASE_FILENAME)

		@mstdn.user_timeline(MASTODON_ACCOUNT_ID).each do |post|
			post.attributes["tags"].each do |tag|
				if tag["name"] == TARGET_HASHTAG then
					day = Time.parse(post.attributes["created_at"]).strftime('%Y-%m-%d %H:%M:%S')
					lunch = post.content.gsub(/<(.+?)>/, "").gsub(/((@|#)[a-zA-Z]*| )/, "")
					@db.add_if_new(day, lunch)
				end
			end
		end
	end

	def latest()
		@db.latest()
	end
end