# frozen_string_literal: true

class EvilEvents::Core::Events::Serializers
  class XML
    # @api private
    # @since 0.4.0
    class Packer < Base::DataTransformer
      # @param event [EvilEvents::Core::Events::AbstractEvent]
      # @raise [EvilEvents::XMLSerializationError]
      # @return [String]
      #
      # @see Base::DataTransformer
      #
      # @api private
      # @since 0.4.0
      def call(event)
        unless event.is_a?(EvilEvents::Core::Events::AbstractEvent)
          raise EvilEvents::XMLSerializationError
        end

        serialization_state = build_serialization_state(event)
        engine.dump(serialization_state)
      end
    end
  end
end
