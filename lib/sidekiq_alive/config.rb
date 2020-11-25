# frozen_string_literal: true

module SidekiqAlive
  class Config
    include Singleton

    attr_accessor :liveness_key,
                  :time_to_live,
                  :callback,
                  :registered_instance_key,
                  :file_path,
                  :queue_prefix

    def initialize
      set_defaults
    end

    def set_defaults
      @liveness_key = 'SIDEKIQ::LIVENESS_PROBE_TIMESTAMP'
      @time_to_live = 10 * 60
      @callback = proc {}
      @registered_instance_key = 'SIDEKIQ_REGISTERED_INSTANCE'
      @file_path = "/tmp/worker_liveness"
      @queue_prefix = :sidekiq_alive
    end

    def registration_ttl
      @registration_ttl || time_to_live + 60
    end
  end
end
