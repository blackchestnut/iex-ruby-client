# frozen_string_literal: true

module IEX
  module Endpoints
    module Dividends
      # https://iexcloud.io/docs/api/#dividends-basic
      def dividends symbol, range = nil, options = {}
        get(
          ['stock', symbol, 'dividends', range].compact.join('/'),
          { token: publishable_token }.merge(options)
        ).map do |data|
          IEX::Resources::Dividends.new data
        end
      rescue Faraday::ResourceNotFound => e
        raise IEX::Errors::SymbolNotFoundError.new symbol, e.response[:body]
      end
    end
  end
end
