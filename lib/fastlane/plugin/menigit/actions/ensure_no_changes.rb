require 'fastlane'

module Fastlane
  module Actions
    class EnsureNoChangesAction < Action
      def self.run(params)
        path = params[:path]
        git_diff = Actions.sh("git diff #{path}")
        no_changes = git_diff.empty?
        if no_changes
          UI.success("Git diff for #{path} is clean, all good! 💪")
        else
          error_message = params[:error_message]
          error_message ||= "Git diff for #{path} is dirty! Please ensure the repo is in a clean state by committing/stashing/discarding all changes first."
          if params[:show_diff]
            error_message += "\nGit diff:\n#{git_diff}"
          end
          UI.user_error!(error_message)
        end
      end

      def self.description
        "Raises an exception if there are uncommitted git changes at path"
      end

      def self.available_options
        [
          FastlaneCore::ConfigItem.new(key: :path,
                                       env_name: "ENSURE_NO_CHANGES_PATH",
                                       description: "Path for directory/file that you want check for diff",
                                       optional: false,
                                       type: String),
          FastlaneCore::ConfigItem.new(key: :show_diff,
                                       env_name: "ENSURE_NO_CHANGES_SHOW_DIFF",
                                       description: "The flag whether to show the git diff if the repo is dirty",
                                       optional: true,
                                       default_value: false,
                                       type: Boolean),
          FastlaneCore::ConfigItem.new(key: :error_message,
                                       env_name: "ENSURE_NO_CHANGES_ERROR_MESSAGE",
                                       description: "Error message that will be show instead of default one based on path",
                                       optional: true,
                                       type: String)
        ]
      end

      def self.example_code
        [
          'ensure_no_changes(path: "fastlane/Fastfile", show_diff: true)'
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
