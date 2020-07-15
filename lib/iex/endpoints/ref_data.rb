# frozen_string_literal: true

module IEX
  module Endpoints
    module RefData
      def ref_data_isin isins, options = {}
        response = get(
          'ref-data/isin',
          { token: publishable_token, isin: isins.join(',') }.merge(options)
        )

        if response.is_a?(Hash)
          response.transform_values do |rows|
            rows&.map { |row| IEX::Resources::Symbol.new(row) }
          end
        else
          response.map { |row| IEX::Resources::Symbol.new(row) }
        end
      end

      def ref_data_symbols options = {}
        response = get(
          'ref-data/symbols',
          { token: publishable_token }.merge(options)
        )
        response.map { |row| IEX::Resources::Symbols.new(row) }
      end

      def ref_data_iex_symbols options = {}
        response = get(
          'ref-data/iex/symbols',
          { token: publishable_token }.merge(options)
        )
        response.map { |row| IEX::Resources::IexSymbol.new(row) }
      end
    end
  end
end
