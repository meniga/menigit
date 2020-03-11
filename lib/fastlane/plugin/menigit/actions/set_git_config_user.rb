require 'fastlane'

module Fastlane
  module Actions
    class SetGitConfigUserAction < Action
      def self.run(options)
        name = options[:name]
        email = options[:email]

        UI.message("Setting git config user.name to #{name} 🎯.")
        Actions.sh("git config user.name #{name.shellescape}")

        UI.message("Setting git config user.email to #{email} 🎯.")
        Actions.sh("git config user.email #{email.shellescape}")
      end

      def self.description
        "This will set git config user"
      end

      def self.details
        [
          "This will automatically set git config user, where:",
          "- `email` is the user email",
          "- `name` is the user name"
        ].join("\n")
      end

      def self.available_options
        [
          FastlaneCore::ConfigItem.new(key: :name,
                                         env_name: "FL_SET_GIT_CONFIG_USER_NAME",
                                         description: "User name",
                                         optional: false,
                                         type: String),

          FastlaneCore::ConfigItem.new(key: :email,
                                         env_name: "FL_SET_GIT_CONFIG_USER_EMAIL",
                                         description: "User email",
                                         optional: false,
                                         type: String)
        ]
      end

      def self.example_code
        [
          'set_git_config_user(name: "MenigaBuildsson", email: "mobile.dev@meniga.com")'
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
