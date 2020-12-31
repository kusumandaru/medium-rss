require 'jekyll'
require 'feedjira'
require 'httparty'
require 'active_support'
require 'active_support/core_ext/string/inflections'
require 'active_support/core_ext/string/access'
require 'nokogiri'

module Jekyll
  class MediumPost < Generator
    safe true
    priority :high

    def generate(site)
      generate =  ENV["GENERATE"]
      return unless generate == 'true'

      username = ENV["MEDIUM_USERNAME"]
      raise CustomError.new(username), "medium username cannot blank" if username.nil?

      url = "https://medium.com/feed/@#{username}"
      xml = ::HTTParty.get(url).body
      feeds = Feedjira.parse(xml)

      feeds.entries.each do |entry|
        p "Title: #{entry.title}, published on Medium #{entry.url} #{entry}"
        
        create_file(entry, site)
      end
    end

    def image_url(content)
      doc = Nokogiri::HTML(content)
      doc.xpath("//img")[0]['src']
    end

    def create_file(entry, site)
      title = entry.title
      content = entry.content
      guid = entry.entry_id
      url = entry.url
      category = entry.categories
      author = entry.author
      published = entry.published
      image = image_url(content)

      path_file = "./_posts/" + published.strftime('%F') + '-' + title.parameterize.first(15) + ".md"
      path = site.in_source_dir(path_file)

      File.open(path, 'wb') do |file| 
        file.write "---"
        file.write "\n"
        file.write "layout: post"
        file.write "\n"
        file.write "title: #{title}"
        file.write "\n"
        # file.write "author: #{author}"
        file.write "author: ndaru"
        file.write "\n"
        file.write "categories: #{category}"
        file.write "\n"
        file.write "image: #{image}"
        file.write "\n"
        file.write "---"
        file.write "\n"
        
        file.write content
      end
    end
  end

  class CustomError < StandardError
    attr_reader :object

    def initialize(object)
      @object = object
    end
  end
end