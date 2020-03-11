require 'fastlane'

module Fastlane
  module Actions
    class RemoveGitRemoteAction < Action
      def self.run(options)
        remote = options[:remote]

        UI.message("Removing remote #{remote} 🎯.")
        Actions.sh("git remote rm #{remote.shellescape}")
      end

      def self.description
        "This will remove a remote repository"
      end

      def self.details
        [
          "This will automatically remove a remote repository, where:",
          "- `remote` is the remote name"
        ].join("\n")
      end

      def self.available_options
        [
          FastlaneCore::ConfigItem.new(key: :remote,
                         env_name: "FL_REMOVE_GIT_REMOTE_REMOTE",
                         description: "Remote name",
                         optional: false,
                         type: String)
        ]
      end

      def self.example_code
        [
          'remove_git_remote(remote: "origin")'
        ]
      end

      def self.category
        :source_control
      end

      def self.is_supported?(platform)
        true
      end

      def self.authors
        ["Marcin Stepnowski"]
      end
    end
  end
end
