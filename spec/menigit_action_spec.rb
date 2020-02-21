describe Fastlane::Actions::MenigitAction do
  describe '#run' do
    it 'prints a message' do
      expect(Fastlane::UI).to receive(:message).with("The menigit plugin is working!")

      Fastlane::Actions::MenigitAction.run(nil)
    end
  end
end
