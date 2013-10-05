require 'xml/libxml'
require 'find'
require 'open-uri'
require 'net/http'
require 'uri'

class Entry < ActiveRecord::Base
  belongs_to :feed
  
  def self.get_news_feeds
    Feed.all.collect do |feed |
      raw_xml = open(feed.url).read
       source =XML::Parser.string(raw_xml)
       content = source.parse
       entries = content.root.find('/rss/channel/item')
       entries.each do | each_item |
          title = each_item.find_first('title').content
          url=each_item.find_first('link').content
          published_date=each_item.find_first('pubDate').content
          puts "#{title}  ==> #{url}  ==>#{published_date}"
          
         check_entry =  Entry.where("title=?",title).last
         if not check_entry
           Entry.create(:title=>title,:url=>url,:published_date=>published_date,:feed_id=>feed.id)
         end
          
       end
    end
  end
end
