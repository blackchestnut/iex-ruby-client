# frozen_string_literal: true

module IEX
  module Resources
    class Dividends < Resource
      property 'amount'
      property 'currency'
      property 'date'
      property 'declared_date', from: 'declaredDate'
      property 'description'
      property 'ex_date', from: 'exDate'
      property 'frequency'
      property 'payment_date', from: 'paymentDate'
      property 'record_date', from: 'recordDate'

      def initialize data
        super
        self['date'] = Time.at date / 1_000
      end
    end
  end
end
