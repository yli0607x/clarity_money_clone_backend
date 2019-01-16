class Api::V1::WeatherController < ApplicationController
    #before_action :set_api_params
  
    def weathers
        # @weathers = RestClient.get("#{@base_url}/#{@api_key}/#{params[:latitude]},#{params[:longitude]}")
        
        @weathers = RestClient.get("https://api.darksky.net/forecast/4e51358eb05697d0cf3779072d5d0a9a/#{params[:latitude]},#{params[:longitude]}?&exclude=flags%2Cminutely")
      render json: @weathers
    end
  
    private
  
    # def set_api_params
    #   @api_key = "4e51358eb05697d0cf3779072d5d0a9a"
    #   @base_url = "https://api.darksky.net/forecast"
    # end
  
  end
