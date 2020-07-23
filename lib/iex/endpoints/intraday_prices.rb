# frozen_string_literal: true

module IEX
  module Endpoints
    module IntradayPrices
      def intraday_prices(symbol, options = {})
        response = get(
          "stock/#{symbol}/intraday-prices",
          { token: publishable_token }.merge(options)
        )
        response.map { |v| IEX::Resources::IntradayPrice.new v }
      rescue Faraday::ResourceNotFound => e
        raise IEX::Errors::SymbolNotFoundError.new(symbol, e.response[:body])
      end
    end
  end
end
