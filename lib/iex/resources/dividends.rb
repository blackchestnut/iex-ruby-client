# frozen_string_literal: true

# https://iexcloud.io/docs/api/#dividends-basic
module IEX
  module Resources
    class Dividends < Resource
      property 'amount' # Refers to the payment amount
      property 'currency' # Currency of the dividend
      property 'date' # The date field of the time series as epoch timestamp
      property 'flag' # The payment type.
      property 'declared_date', from: 'declaredDate' # Refers to the dividend declaration date
      property 'description' # Description of the dividend event
      property 'ex_date', from: 'exDate' # Refers to the dividend ex-date
      property 'frequency' # Frequency of the dividend
      property 'payment_date', from: 'paymentDate' # Refers to the payment date
      property 'record_date', from: 'recordDate' # Refers to the dividend record date

      def initialize data
        super
        self['date'] = Time.at date / 1_000
      end
    end
  end
end
