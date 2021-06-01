module RandomOrgHttpApi
  module Error
    class QuotaError < StandardError
      def message
        'Quota is over. Please try again later.'
      end
    end
  end
end



