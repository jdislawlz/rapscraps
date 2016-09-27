class WelcomeController < ApplicationController
	def index
		@tweets = $client.user_timeline('Rap_scraps', count: 5)
	end
end
