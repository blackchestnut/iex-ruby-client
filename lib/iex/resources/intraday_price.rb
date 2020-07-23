# frozen_string_literal: true

module IEX
  module Resources
    class IntradayPrice < Resource
      property 'date'
      property 'minute'
      property 'label'
      property 'high'
      property 'low'
      property 'open'
      property 'close'
      property 'average'
      property 'volume'
      property 'notional'
      property 'numberOfTrades'

      def time
        Time.use_zone('Eastern Time (US & Canada)') do
          Time.zone.parse("#{date} #{minute}")
        end
      end
    end
  end
end
