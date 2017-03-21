class WelcomeController < ApplicationController
	require 'date'
	def index
		@tweets = $client.user_timeline('Rap_scraps', count: 10)
		@new = []
		@tweets.each do |tweet|
			if tweet.full_text[/\(\d+[\/,\\]\d+\)/]
				first = tweet.full_text[/\(\d+[\/,\\]\d+\)/]
			  puts tweet.full_text[/\(\d+[\/,\\]\d+\)/]
				@new << "yess"
			else
				puts "cool"
				@new << tweet.full_text
			end
		end
		@new.each do |newt|
			puts newt
		end
	end
end
