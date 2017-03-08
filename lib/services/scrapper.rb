require "open-uri"
require "nokogiri"

module Services
  class Scrapper

    def scrap_artsy_all
      result = []
      html_file = open("https://www.artsy.net/artists")
      html_doc = Nokogiri::HTML(html_file)
      html_doc.search('.grid-item').search('.artist-cell-item__artist-name').each do |element|
        end_url = element.text.split(' ').join('-')
        result << end_url
      end
      result
    end

    def scrap_artsy(artist)

      html_file = open("https://www.artsy.net/artist/#{artist}")
      html_doc = Nokogiri::HTML(html_file)

      html_doc.search('.artist-header-name').each do |element|
        name = element.text
      end

      html_doc.search('.blurb').each do |element|
        description = element.text
      end

      { name: name, description: description }
    end
  end
end
