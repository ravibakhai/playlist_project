require 'open-uri'

class Facebook
  def self.profile(token)
    url = 'https://graph.facebook.com/me'
    url += '?access_token=' + token
    open(URI::encode(url)).read
  end
end
