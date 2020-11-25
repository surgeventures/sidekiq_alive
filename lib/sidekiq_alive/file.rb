# frozen_string_literal: true

module SidekiqAlive
  class File
    class << self
      def run!
        loop do
          ::File.write(SidekiqAlive.config.file_path, "healthy") if SidekiqAlive.alive?
          sleep(30)
        end
      end
    end
  end
end
