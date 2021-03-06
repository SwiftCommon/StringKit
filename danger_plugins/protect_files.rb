module Danger
  class Files < Plugin
    def protect_files(path: nil, message: nil, fail_build: false, callback: nil)
      raise "You have to provide a message" if message.to_s.empty?
      raise "You have to provide a path" if path.to_s.empty?
      raise "You have to provide a callback" if callback.nil?

      broken_rule = git.modified_files.include?(path)

      return unless broken_rule
      callback.call(message, !fail_build)
    end
  end
end
