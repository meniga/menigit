require 'fastlane'

module Fastlane
  module Actions
    class AddGitRemoteAction < Action
      def self.run(options)
        remote = options[:remote]
        path = options[:path]
        UI.message("Adding remote #{remote} #{path} 🎯.")
        Actions.sh("git remote add #{remote.shellescape} #{path.shellescape}")
      end

      def self.description
        "This will add a remote repository"
      end

      def self.details
        [
          "This will automatically add a remote repository, where:",
          "- `remote` is the remote name",
          "- `path` is the remote path (URL or SSH)"
        ].join("\n")
      end

      def self.available_options
        [
          FastlaneCore::ConfigItem.new(key: :remote,
                         env_name: "FL_ADD_GIT_REMOTE_REMOTE",
                         description: "Remote name",
                         optional: false,
                         is_string: true),
          FastlaneCore::ConfigItem.new(key: :path,
                         env_name: "FL_ADD_GIT_REMOTE_PATH",
                         description: "Path to repository. URL or SSH",
                         optional: false,
                         is_string: true)
        ]
      end

      def self.example_code
        [
          'add_git_remote(remote: "origin", path: "https://github.com/meniga/menigit")'
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
