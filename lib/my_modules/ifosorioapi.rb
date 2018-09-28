module Ifosorioapi 

	def doLogin(login, password)

		url = 'https://sistrac.osorio.ifrs.edu.br/ifrsosoapi'

		conn = Faraday.new(:url => url) do |faraday|
			faraday.request :url_encoded
			faraday.response :json
      # faraday.response :logger               
      faraday.adapter  Faraday.default_adapter 

  		end


  		response = conn.post('login', {'login': login, 'password': password})

    # binding.pry

	end

end