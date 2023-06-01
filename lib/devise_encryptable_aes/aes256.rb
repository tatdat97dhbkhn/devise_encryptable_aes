# frozen_string_literal: true

require 'aes'
require 'devise/encryptable/encryptors/base'

module Devise
  module Encryptable
    module Encryptors
      # Add AES encryption support for Devise
      class Aes256 < Base
        class << self
          def digest(password, _stretches, salt, pepper)
            ::AES.encrypt(password, pepper, { iv: salt }) if password
          rescue StandardError
            nil
          end

          def salt(_stretches)
            ::AES.iv(:base_64)
          end

          def decrypt(encrypted_password, pepper)
            ::AES.decrypt(encrypted_password, pepper)
          end

          def compare(encrypted_password, password, pepper)
            return false if encrypted_password.blank?

            decrypt(encrypted_password, pepper) == password
          end
        end
      end
    end
  end
end
