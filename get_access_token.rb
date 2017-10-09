require 'mastodon'
require 'oauth2'
require './account.rb'

MASTODON_HOST = 'https://handon.club'
MASTODON_APP_NAME = 'hanlunch'

mastodon = Mastodon::REST::Client.new(base_url: MASTODON_HOST)
app = mastodon.create_app(MASTODON_APP_NAME, 'urn:ietf:wg:oauth:2.0:oob', 'read write follow')

client = OAuth2::Client.new(app.client_id, app.client_secret, site: MASTODON_HOST)
token = client.password.get_token(MASTODON_USER_ID, MASTODON_USER_PASSWORD, scope: 'read write follow')

print "client_id: #{app.client_id}\n"
print "client_secret: #{app.client_secret}\n"
print "access_token: #{token.token}\n"