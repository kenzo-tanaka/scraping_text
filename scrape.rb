require 'nokogiri'
require 'open-uri'

url = 'https://wow-u.jp/media/food/busshukan_saga'

charset = nil

html = open(url) do |f|
    charset = f.charset
    f.read
end

doc = Nokogiri::HTML.parse(html, nil, charset)
doc.css('.rich-text').each do |node|
    p node.inner_text.strip
end
