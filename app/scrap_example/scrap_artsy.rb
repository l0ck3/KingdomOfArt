require "open-uri"
require "nokogiri"

def scrap_artsy(artist)
  result = []
  html_file = open("https://www.artsy.net/artist/#{artist}")
  html_doc = Nokogiri::HTML(html_file)

  html_doc.search('.artist-header-name').each do |element|
    result << element.text
  end
  html_doc.search('.artist-header-birthdate').each do |element|
    result << element.text
  end
  result
end
