describe Fastlane::Actions::AddGitRemoteAction do
  describe 'Add git remote' do
    it 'should call git remote name path' do
      expect(Fastlane::Actions).to receive(:sh).with("git remote add testRemote https://github.com/meniga/mobile-sdk-ios")

      Fastlane::Actions::AddGitRemoteAction.run({
        remote: "testRemote",
        path: "https://github.com/meniga/mobile-sdk-ios"
      })
    end
  end
end
