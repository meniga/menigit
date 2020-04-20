describe Fastlane::Actions::EnsureNoChangesAction do
  describe 'Ensure no changes' do
    git_diff = [
      "diff --git a/fastlane/Fastfile b/fastlane/Fastfile",
      "\nindex f891d47..baaad1d 100644",
      "\n--- a/fastlane/Fastfile",
      "\n+++ b/fastlane/Fastfile",
      "\n@@ -1,3 +1,3 @@",
      "\n lane :test do",
      "\n-  menigit",
      "\n+  fail",
      "\n end"
    ].join
    provided_error_message = "Fastfile changed! You shouldn't change this file!"

    it 'should succeed when git diff is empty' do
      expect(Fastlane::Actions).to receive(:sh).with("git diff fastlane/Fastfile") { "" }
      expect(Fastlane::UI).not_to(receive(:user_error!))

      Fastlane::Actions::EnsureNoChangesAction.run({
          path: "fastlane/Fastfile"
      })
    end

    it 'should fail when git diff is not empty' do
      expect(Fastlane::Actions).to receive(:sh).with("git diff fastlane/Fastfile") { git_diff }
      error = [
        "Git diff for fastlane/Fastfile is dirty! ",
        "Please ensure the repo is in a clean state by committing/stashing/discarding all changes first."
      ].join
      expect(Fastlane::UI).to receive(:user_error!).with(error)

      Fastlane::Actions::EnsureNoChangesAction.run({
          path: "fastlane/Fastfile"
      })
    end

    it 'should fail when git diff is not empty and print provided error message' do
      expect(Fastlane::Actions).to receive(:sh).with("git diff fastlane/Fastfile") { git_diff }
      expect(Fastlane::UI).to receive(:user_error!).with(provided_error_message)

      Fastlane::Actions::EnsureNoChangesAction.run({
          path: "fastlane/Fastfile",
          error_message: provided_error_message
      })
    end

    it 'should fail and print diff when git diff is not empty and show_diff is true' do
      expect(Fastlane::Actions).to receive(:sh).with("git diff fastlane/Fastfile") { git_diff }
      error = [
        "Git diff for fastlane/Fastfile is dirty! ",
        "Please ensure the repo is in a clean state by committing/stashing/discarding all changes first.",
        "\nGit diff:",
        "\n",
        git_diff
      ].join
      expect(Fastlane::UI).to receive(:user_error!).with(error)

      Fastlane::Actions::EnsureNoChangesAction.run({
          path: "fastlane/Fastfile",
          show_diff: true
      })
    end

    it 'should fail and print diff with provided error message when git diff is not empty and show_diff is true' do
      expect(Fastlane::Actions).to receive(:sh).with("git diff fastlane/Fastfile") { git_diff }
      error = [
        provided_error_message,
        "\nGit diff:",
        "\n",
        git_diff
      ].join
      expect(Fastlane::UI).to receive(:user_error!).with(error)

      Fastlane::Actions::EnsureNoChangesAction.run({
          path: "fastlane/Fastfile",
          show_diff: true,
          error_message: provided_error_message
      })
    end
  end
end
