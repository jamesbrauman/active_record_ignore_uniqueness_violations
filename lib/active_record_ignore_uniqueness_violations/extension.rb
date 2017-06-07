require 'active_support/core_ext/class'

module ActiveRecordIgnoreUniquenessViolations
  module Extension
    extend ActiveSupport::Concern

    included do
      def create_or_update(*params, &block)
        puts "create_or_update called"
        super
      rescue ActiveRecord::RecordNotUnique
      end
    end
  end
end
