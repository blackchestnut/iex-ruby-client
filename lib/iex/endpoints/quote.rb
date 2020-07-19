# frozen_string_literal: true

module IEX
  module Endpoints
    module Quote
      # https://iexcloud.io/docs/api/#quote
      def quote(symbol, options = {})
        IEX::Resources::Quote.new(
          get(
            "stock/#{symbol}/quote",
            { token: publishable_token }.merge(options)
          )
        )
      rescue Faraday::ResourceNotFound => e
        raise IEX::Errors::SymbolNotFoundError.new(symbol, e.response[:body])
      end

      # https://iexcloud.io/docs/api/#quote
      def quote_field(symbol, field, options = {})
        get(
          "stock/#{symbol}/quote/#{field}",
          { token: publishable_token }.merge(options)
        )
      rescue Faraday::ResourceNotFound => e
        raise IEX::Errors::SymbolNotFoundError.new(symbol, e.response[:body])
      end
    end
  end
end
