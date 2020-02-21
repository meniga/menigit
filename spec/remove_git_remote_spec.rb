describe Fastlane::Actions::RemoveGitRemoteAction do
  describe 'Remove git remote' do
    it 'should call git remote rm name' do
      expect(Fastlane::Actions).to receive(:sh).with("git remote rm testRemote")

      Fastlane::Actions::RemoveGitRemoteAction.run({
        remote: "testRemote"
      })
    end
  end
end
