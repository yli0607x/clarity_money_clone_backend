# @client = Plaid::Client.new(env: 'sandbox', client_id: '5c33a11648339d0011601840', secret: '01086502547dce8daae477c6edc161', public_key: 'b1e735eeb3e7304310b6da558410ce')
# @access_token = nil

class Api::V1::PlaidController < ApplicationController
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
        now = Date.today
        one_year_ago = (now - 365)
        @product_response = @client.transactions.get(@access_token, one_year_ago, now, count: 500)
        
        render json: {"data": @product_response}
        
    end


    def transactions
        byebug
        now = Date.today
        thirty_days_ago = (now - 30)
        product_response = @client.transactions.get(@access_token, thirty_days_ago, now)
        render json: product_response
    end



end