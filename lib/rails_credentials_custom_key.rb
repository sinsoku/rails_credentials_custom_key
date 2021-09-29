# frozen_string_literal: true

require_relative "rails_credentials_custom_key/version"

module RailsCredentialsCustomKey
  class << self
    attr_accessor :custom

    def required?
      Rails.const_defined?(:Command) &&
        Rails::Command.const_defined?(:CredentialsCommand)
    end

    def init!(&block)
      return unless required?
      raise ArgumentError, "no block given" if block.nil?

      self.custom = block
      ActiveSupport::EncryptedFile.prepend(EncryptedFileExtention)
    end
  end

  module EncryptedFileExtention
    def key
      RailsCredentialsCustomKey.custom[self] || super
    end
  end
end
