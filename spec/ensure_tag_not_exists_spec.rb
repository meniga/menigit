describe Fastlane::Actions::EnsureTagNotExistsAction do
  describe 'Ensure tag not exists' do
    before :each do
      expect(Fastlane::UI).to receive(:success).with("Driving the lane 'test' 🚀")
    end

    it 'should succeed when tag not exists' do
      expect(Fastlane::Actions::GitTagExistsAction).to receive(:run) .and_return(false)
      expect(Fastlane::UI).not_to(receive(:user_error!))
      expect(Fastlane::UI).to receive(:success).with("Success! Tag 1.2.0 not exists!")

      Fastlane::FastFile.new.parse("lane :test do
        ensure_tag_not_exists(tag: '1.2.0')
      end").runner.execute(:test)
    end

    it 'should fail when tag exists' do
      expect(Fastlane::Actions::GitTagExistsAction).to receive(:run) .and_return(true)
      expect(Fastlane::UI).to receive(:user_error!).with("Tag 1.2.0 already exists!")
      expect(Fastlane::UI).not_to(receive(:success))

      Fastlane::FastFile.new.parse("lane :test do
          ensure_tag_not_exists(tag: '1.2.0')
        end").runner.execute(:test)
    end

    it 'should show proper user error when remote parameter is passed and tag exist' do
      expect(Fastlane::Actions::GitTagExistsAction).to receive(:run) .and_return(true)
      expect(Fastlane::UI).to receive(:user_error!).with("Tag 1.2.0 already exists in notOrigin!")
      expect(Fastlane::UI).not_to(receive(:success))

      Fastlane::FastFile.new.parse("lane :test do
        ensure_tag_not_exists(tag: '1.2.0', remote: true, remote_name: 'notOrigin')
      end").runner.execute(:test)
    end
  end
end
