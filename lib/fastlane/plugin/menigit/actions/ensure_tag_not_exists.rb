require 'fastlane'

module Fastlane
  module Actions
    class EnsureTagNotExistsAction < Action
      def self.run(params)
        tag = params[:tag]
        remote = params[:remote]
        remote_name = params[:remote_name]
        if other_action.git_tag_exists(tag: tag, remote: remote, remote_name: remote_name)
          error_message = "Tag #{tag} already exists"
          if remote
            error_message += " in #{remote_name}"
          end
          error_message += "!"
          UI.user_error!(error_message)
        else
          UI.success("Success! Tag #{tag} not exists!")
        end
      end

      def self.description
        "Checks if the git tag with the given name not exists in the current repo"
      end

      def self.available_options
        [
          FastlaneCore::ConfigItem.new(key: :tag,
                         env_name: "FL_ENSURE_TAG_NOT_EXISTS_TAG",
                         description: "The tag name that should be checked",
                         optional: false,
                         is_string: true),
          FastlaneCore::ConfigItem.new(key: :remote,
                         env_name: "FL_ENSURE_TAG_NOT_EXISTS_TAG_REMOTE",
                         description: "Whether to check remote. Defaults to true",
                         optional: true,
                         default_value: false,
                         type: Boolean),
          FastlaneCore::ConfigItem.new(key: :remote_name,
                          env_name: "FL_ENSURE_TAG_NOT_EXISTS_TAG_REMOTE_NAME",
                          description: "Whether to check remote. Defaults to true",
                          optional: true,
                          default_value: "origin",
                          is_string: true)
        ]
      end

      def self.example_code
        [
          'ensure_tag_not_exist(tag: "3.2.2", remote: true)'
        ]
      end

      def self.category
        :source_control
      end

      def self.is_supported?(platform)
        true
      end

      def self.authors
        ["Artur Stępniewski"]
      end
    end
  end
end
