<?xml version="1.0" encoding="UTF-8"?>
<rss xmlns:itunes="http://www.itunes.com/dtds/podcast-1.0.dtd" version="2.0">
	<channel>
		<title>Coding Jedi</title>
		<link>https://codingjedi.club<link>
		<language>en-us</language>

		<itunes:subtitle>Learn to solve coding problems</itunes:subtitle>
		<itunes:author>Bala Paranj</itunes:author>
		<itunes:summary>
			Become a problem solver by solving problems without any memorization
		</itunes:summary>
		<description>
			This podcast will guide you through solving coding problems to make you a problem solver capable of solving any coding problems in a technical interview.
		</description>
		<itunes:owner>
			<itunes:name>Bala Paranj</itunes:name>
			<itunes:email>bparanj@zepho.com</itunes:email>
		</itunes:owner>
		<itunes:explicit>no</itunes:explicit>
		<itunes:image href="http://www.codingskill.club/podcast-icon.jpg" />
		<itunes:category text="Category Name"/></itunes:category>

		<!--REPEAT THIS BLOCK FOR EACH VIDEO-->
		<item>
			<title>Head and Tail Recursion</title>
			<itunes:summary>Basics of head and tail recursion</itunes:summary>
			<description>Description of podcast episode content</description>
			<link>http://example.com/podcast-1</link>
			<enclosure url="http://example.com/podcast-1/podcast.mp3" type="audio/mpeg" length="1024"></enclosure>
			<pubDate>Thu, 21 Dec 2016 16:01:07 +0000</pubDate>
			<itunes:author>Author Name</itunes:author>
			<itunes:duration>00:32:16</itunes:duration>
			<itunes:explicit>no</itunes:explicit>
			<guid>http://example.com/podcast-1</guid>
		</item> 
		<!--END REPEAT--> 
   
	</channel>
</rss>





<?xml version="1.0" encoding="UTF-8"?>
<rss version="2.0"
    xmlns:googleplay="http://www.google.com/schemas/play-podcasts/1.0"
    xmlns:itunes="http://www.itunes.com/dtds/podcast-1.0.dtd">
  <channel>
    <title>Dafna's Zebra Podcast</title>
    <googleplay:owner>dafna@example.com</googleplay:owner>
    <googleplay:author>Dafna</googleplay:author>
    <description>A pet-owner's guide to the popular striped equine.</description>
    <googleplay:image href="https://www.example.com/podcasts/dafnas-zebras/img/dafna-zebra-pod-logo.jpg"/>
    <language>en-us</language>
    <link>https://www.example.com/podcasts/dafnas-zebras/</link>
		
    <item>
      <title>Top 10 myths about caring for a zebra</title>
      <description>Here are the top 10 misunderstandings about the care, feeding, and breeding of these lovable striped animals.</description>
      <pubDate>Tue, 14 Mar 2017 12:00:00 GMT</pubDate>
      <enclosure url="https://www.example.com/podcasts/dafnas-zebras/audio/toptenmyths.mp3"
                 type="audio/mpeg" length="34216300"/>
      <itunes:duration>30:00</itunes:duration>
      <guid isPermaLink="false">dzpodtop10</guid>
    </item>
    
		<item>
      <title>Keeping those stripes neat and clean</title>
      <description>Keeping your zebra clean is time consuming, but worth the effort.</description>
      <pubDate>Fri, 24 Feb 2017 12:00:00 GMT</pubDate>
      <enclosure url="https://www.example.com/podcasts/dafnas-zebras/audio/cleanstripes.mp3"
                 type="audio/mpeg" length="26004388"/>
      <itunes:duration>22:48</itunes:duration>
      <guid>dzpodclean</guid>
    </item>
  
	</channel>
</rss>


https://support.google.com/podcast-publishers/answer/9889544?hl=en



class FeedsController < ApplicationController
 
  layout false
 
  def rss
    @posts = Post.published_posts.limit(50)
  end
 
end



Then create a view in views/feeds/podcast.rss.builder for RSS.

xml.instruct!
xml.rss :version => '2.0', 'xmlns:atom' => 'http://www.w3.org/2005/Atom' do
 
  xml.channel do
    xml.title 'Feed title'
    xml.description 'Feed description'
    xml.link root_url
    xml.language 'en'
    xml.tag! 'atom:link', :rel => 'self', :type => 'application/rss+xml', :href => posts_url
 
    for post in @posts
      xml.item do
        xml.title post.title
        xml.category post.category.name
        xml.pubDate(post.created_at.rfc2822)
        xml.link post_url(post)
        xml.guid post_url(post)
        xml.description(h(post.body))
        xml.image_url post.image_url
      end
    end
 
  end
 
end

get 'feed.rss', to: 'feeds#rss', :format => 'rss'


<%= auto_discovery_link_tag(:rss, "http://example.com") %>



title       = "GoRails Screencasts"
author      = "Chris Oliver"
description = "GoRails is a series of screencasts and guides for all aspects of Ruby on Rails. Learn how to setup your machine, build a Rails application, and deploy it to a server."
keywords    = "rails, ruby on rails, screencasts, programming, refactoring, coding"
image       = asset_url("itunes.png")

xml.instruct! :xml, version: "1.0"
xml.rss version: "2.0", "xmlns:itunes" => "http://www.itunes.com/dtds/podcast-1.0.dtd", "xmlns:media" => "http://search.yahoo.com/mrss/" do
  xml.channel do
    xml.title title
    xml.link episodes_url
    xml.description description
    xml.language 'en'
    xml.pubDate @episodes.first.created_at.to_s(:rfc822)
    xml.lastBuildDate @episodes.first.created_at.to_s(:rfc822)
    xml.itunes :author, author
    xml.itunes :keywords, keywords
    xml.itunes :explicit, 'clean'
    xml.itunes :image, :href => image
    xml.itunes :owner do
      xml.itunes :name, author
      xml.itunes :email, 'chris@gorails.com'
    end
    xml.itunes :block, 'no'
    xml.itunes :category, text: 'Technology' do
      xml.itunes :category, text: 'Software How-To'
    end
    xml.itunes :category, text: 'Education' do
      xml.itunes :category, text: 'Training'
    end

    @episodes.each do  |episode|
      xml.item do
        xml.title episode.name
        xml.summary episode.description
        xml.pubDate episode.created_at.to_s(:rfc822)
        xml.enclosure url: episode.download_url, length: episode.file_size, type: 'video/mp4'
        xml.link episode_url(episode)
        xml.guid({isPermaLink: "false"}, episode.slug)
        xml.itunes :author, author
        xml.itunes :subtitle, truncate(episode.description, length: 150)
        xml.itunes :summary, episode.description
        xml.itunes :explicit, 'no'
        xml.itunes :duration, episode.length
      end
    end
  end
end






