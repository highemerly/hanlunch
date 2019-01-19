

var = '<p><span class=\"h-card\"><a href=\"https://handon.club/@Shiba\" class=\"u-url mention\">@<span>Shiba</span></a></span> ランチセット（海鮮丼＋ミニうどん）<a href=\"https://handon.club/tags/hanlunch\" class=\"mention hashtag\" rel=\"tag\">#<span>hanlunch</span></a></p>'
#puts var.match(/\<\/a\><\/span\>(.*)\<a href/)[1]

puts var.gsub(/<(.+?)>/, "").gsub(/((@|#)[a-zA-Z]*| )/, "")
