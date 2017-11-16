# frozen_string_literal: true

class EvilEvents::Core::Events::Subscriber
  # @api public
  # @since 0.1.0
  Mixin = EvilEvents::Shared::ClonableModuleBuilder.build do
    # @param event_type [Array<String, Class{EvilEvents::Core::Events::AbstractEvent}, Regexp>]
    # @param delegator [String, Symbol, NilClass]
    # @raise [ArgumentError]
    #
    # @since 0.2.0
    def subscribe_to(*event_types, delegator: nil)
      raise ArgumentError unless event_types.all? do |event_type|
        event_type.is_a?(Class) || event_type.is_a?(String) || event_type.is_a?(Regexp)
      end

      event_types.each do |event_type|
        case event_type
        when Class
          EvilEvents::Core::Bootstrap[:event_system].observe(event_type, self, delegator)
        when String
          EvilEvents::Core::Bootstrap[:event_system].raw_observe(event_type, self, delegator)
        when Regexp
          EvilEvents::Core::Bootstrap[:event_system].observe_list(event_type, self, delegator)
        end
      end
    end
  end
end
