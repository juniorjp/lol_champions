class ChampionsController < ApplicationController

  def index
    query = {
      locale: @api_locale.start_with?('pt') ? 'pt_BR': 'en_US',
      champData: 'all',
      api_key: ENV['lol_api_key']
    }

    response = HTTParty.get("#{ENV['lol_api_base_url']}#{ENV['lol_api_list_champion_endpoint']}", query: query)
    render json: response.body, status: response.code
  end

end
