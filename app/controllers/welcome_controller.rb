class WelcomeController < ApplicationController
	require 'date'
	def index
		@tweets = $client.user_timeline('Rap_scraps', count: 10)
		@tweets.each do |tweet|
			if tweet.full_text.include? '(\(\d+[\/,\\]\d+\))'
			   puts "String is a multiple"
			end
		end
	end
end
