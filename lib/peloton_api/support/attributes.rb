module PelotonAPI
  module Support
    # https://github.com/NetSweet/netsuite/blob/master/lib/netsuite/support/attributes.rb
    module Attributes
      def attributes
        @attributes ||= {}
      end

      def attributes=(attributes)
        @attributes = attributes
      end

      def initialize_from_attributes_hash(attributes = {})
        attributes.select do |k, _|
          self.class.fields.include? k
        end.each do |k, v|
          send "#{k}=", v
        end
        self.klass = attributes[:class] if attributes[:class]
      end
    end
  end
end
