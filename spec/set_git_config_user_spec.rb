describe Fastlane::Actions::SetGitConfigUserAction do
  describe 'Set git config user' do
    it 'should call git config user.name and git config user.email' do
      expect(Fastlane::Actions).to receive(:sh).with("git config user.name MenigaBuildsson")
      expect(Fastlane::Actions).to receive(:sh).with("git config user.email mobile.dev@meniga.com")

      Fastlane::Actions::SetGitConfigUserAction.run({
          name: "MenigaBuildsson",
          email: "mobile.dev@meniga.com"
      })
    end
  end
end
