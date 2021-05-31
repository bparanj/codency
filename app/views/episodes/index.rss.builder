title = "Coding Fluency"
author = "Bala Paranj"
link = 'https://www.codingfluency.com'
description = "learn by building web apps."
keywords = "tutorials, training, programming, railscast, web application framework"
ext = 'mp4'

#encoding: UTF-8

xml.instruct! :xml, :version => "1.0"

xml.rss :version => "2.0", "xmlns:itunes" => "http://www.itunes.com/dtds/podcast-1.0.dtd",  "xmlns:media" => "http://search.yahoo.com/mrss/", "xmlns:atom" => "http://www.w3.org/2005/Atom" do
  xml.channel do
    xml.tag!("atom:link",  "href"=>"https://rubyplus.com/episodes.rss", "rel"=>"self", "type"=>"application/rss+xml") 
    xml.title title
    xml.link link
    xml.description description
    xml.language 'en'
    xml.pubDate @episodes.first.created_at.to_s(:rfc822)
    xml.lastBuildDate @episodes.first.created_at.to_s(:rfc822)
    xml.itunes :author, author
    xml.itunes :keywords, keywords
    xml.itunes :explicit, 'clean'
    xml.itunes :image, :href => "http://images.rubyplus.com/RAILS-res-3000px-winning-purple.png"
    xml.itunes :owner do
      xml.itunes :name, author
      xml.itunes :email, 'bparanj@zepho.com'
    end
    xml.itunes :block, 'no'
    xml.itunes :category, :text => 'Technology' do
      xml.itunes :category, :text => 'Software How-To'
    end
    xml.itunes :category, :text => 'Education' do
      xml.itunes :category, :text => 'Training'
    end

    @episodes.each do  |episode|
      xml.item do
        xml.title episode.title
        xml.description episode.description
        xml.pubDate episode.created_at.to_s(:rfc822)
        xml.enclosure :url => "http://media.rubyplus.com/#{episode.file_name}", :length => episode.file_size, :type => 'video/mp4'
        xml.link episode_url(episode)
        xml.guid({:isPermaLink => "false"}, episode_url(episode))
        xml.itunes :author, author
        xml.itunes :subtitle, truncate(episode.description, :length => 150)
        xml.itunes :summary, episode.description
        xml.itunes :explicit, 'no'
        xml.itunes :duration, episode.duration
      end
    end
  end
end