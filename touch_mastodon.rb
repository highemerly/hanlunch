require 'mastodon'

MASTODON_HOST = 'https://handon.club'

mstdn = Mastodon::REST::Client.new(base_url: MASTODON_HOST, bearer_token: ENV['MASTODON_ACCESS_TOKEN'])
mstdn.create_status('test')