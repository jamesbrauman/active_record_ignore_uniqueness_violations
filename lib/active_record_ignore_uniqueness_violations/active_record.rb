require 'active_support'
require 'active_support/core_ext/object/try'
require 'active_record_ignore_uniqueness_violations/extension'

module ActiveRecordIgnoreUniquenessViolations
  module ActiveRecord
    def self.add_extensions
      puts "runnign add extensions"
      ::ActiveRecord::Base.descendants.select do |klass|
        puts "running for klass #{klass.name}"
        habtm_reflections = klass.reflections
          .select do |reflection|
          reflection.is_a?(::ActiveRecord::Reflection::HasAndBelongsToManyReflection) &&
            reflection.options[:ignore_uniqueness_violations] == true
        end

        middle_reflection_klasses = habtm_reflections.map do |habtm_reflection|
          "#{klass.to_s}::HABTM_#{habtm_reflection.plural_name.to_s.camelize}".constantize
        end

        middle_reflection_klasses.each do |middle_reflection_klass|
          puts "including myself in #{middle_reflection_klass.name}"
          middle_reflection_klass.send(:include, ActiveRecordIgnoreUniquenessViolations::Extension)
        end
      end
    end
  end
end

ActiveSupport.on_load(:active_record) do
  puts "active record loaded, calling add_extensions"
  ActiveRecordIgnoreUniquenessViolations::ActiveRecord.add_extensions
end
