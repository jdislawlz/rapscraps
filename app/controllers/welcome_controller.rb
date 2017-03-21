class WelcomeController < ApplicationController
	require 'date'
	def index
		@tweets = $client.user_timeline('Rap_scraps', count: 10)
		@scraps = []
		@tweets.each_with_index do |tweet, index|
			time = DateTime.parse(tweet.created_at.to_s).strftime('%m.%d.%y')
			if tweet.full_text[/\(\d+[\/,\\]\d+\)/]
				this = tweet.full_text[/\(\d+[\/,\\]\d+\)/][1,1].to_i
				total = tweet.full_text[/\(\d+[\/,\\]\d+\)/][3,1].to_i
				diff = total - this
				combined_tweet = ''
				if diff != 0
					for i in 0..diff
						combined_tweet += @tweets[index-i].full_text[0..-6]
					end
				else
					next # don't add multipart scrap to @scraps unless it's the last one
				end
				@scraps << [combined_tweet, time]
			  #puts "#{index}: #{tweet.full_text[/\(\d+[\/,\\]\d+\)/]}"
			else
				@scraps << [tweet.full_text, time]
			end # end if looking for multi-part scrap
		end # end loop through tweets
	end
end
