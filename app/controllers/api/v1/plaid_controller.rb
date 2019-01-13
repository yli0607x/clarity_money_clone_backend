# @client = Plaid::Client.new(env: 'sandbox', client_id: '5c33a11648339d0011601840', secret: '01086502547dce8daae477c6edc161', public_key: 'b1e735eeb3e7304310b6da558410ce')
# @access_token = nil

class Api::V1::PlaidController < ApplicationController
    #before_action :set_api_params
  
    # def weathers
    #     # @weathers = RestClient.get("#{@base_url}/#{@api_key}/#{params[:latitude]},#{params[:longitude]}")
        
    #     @weathers = RestClient.get("https://api.darksky.net/forecast/4e51358eb05697d0cf3779072d5d0a9a/#{params[:latitude]},#{params[:longitude]}?units=si&exclude=flags%2Cminutely")
    #   render json: @weathers
    # end

    # @client = Plaid::Client.new(env: 'sandbox',client_id: '5c33a11648339d0011601840',secret: '01086502547dce8daae477c6edc161',public_key: 'b1e735eeb3e7304310b6da558410ce')

    # @access_token = nil


   

    
    def get_access_token
        # @plaid = Plaid.create(params.permit(:public_token))
        @client = Plaid::Client.new(env: 'sandbox',
                            client_id: '5c33a11648339d0011601840',
                            secret: '01086502547dce8daae477c6edc161',
                            public_key: 'b1e735eeb3e7304310b6da558410ce')
        exchange_token_response = @client.item.public_token.exchange(params['public_token'])
        @access_token = exchange_token_response['access_token']
        render @access_token
        # byebug
    end

    

    def transactions
        # byebug
        now = Date.today
        thirty_days_ago = (now - 30)
        product_response = @client.transactions.get(@access_token, thirty_days_ago, now)
        render json: product_response
    end



# def transaction
#     now = Date.today
#     thirty_days_ago = (now - 30)
#     begin
#       product_response =
#         client.transactions.get(access_token, thirty_days_ago, now)
#       pretty_print_response(product_response)
#       content_type :json
#       { transactions: product_response }.to_json
#     rescue Plaid::PlaidAPIError => e
#       error_response = format_error(e)
#       pretty_print_response(error_response)
#       content_type :json
#       error_response.to_json
#     end
#   end



end