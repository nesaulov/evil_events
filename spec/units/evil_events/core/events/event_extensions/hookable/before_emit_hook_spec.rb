# frozen_string_literal: true

describe EvilEvents::Core::Events::EventExtensions::Hookable::BeforeEmitHook do
  it_behaves_like 'hook component behaviour' do
    let(:hook_class) { described_class }
  end
end
