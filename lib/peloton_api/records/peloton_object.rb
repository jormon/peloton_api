module PelotonAPI
  module Records
    # base class to hold all logic encapsulated by API
    class PelotonObject
      include Support::Fields
      include Support::Attributes

      def initialize(attributes = {})
        initialize_from_attributes_hash attributes
      end
    end
  end
end
