# frozen_string_literal: true

describe EvilEvents::Core::Events::EventExtensions::MetadataExtendable, :stub_event_system do
  it_behaves_like 'metadata extendable interface' do
    let(:metadata_extendable_abstraction) do
      build_event_class_stub do |klass|
        klass.include described_class
      end
    end
  end
end
