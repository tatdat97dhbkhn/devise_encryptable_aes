# frozen_string_literal: true

# -*- encoding: utf-8 -*-
require File.expand_path('../lib/devise_encryptable_aes/version', __FILE__)

Gem::Specification.new do |s|
  s.name        = 'devise_encryptable_aes'
  s.summary     = 'Add AES encryption support for Devise'
  s.description = ''
  s.authors     = ['Pham Tat Dat']
  s.email       = 'tatdat97dhbkhn@gmail.com'
  s.files         = Dir['{lib}/**/*', 'README.md']
  s.require_paths = ['lib']
  s.homepage    = 'https://github.com/tatdat97dhbkhn/devise_encryptable_aes'
  s.license     = 'MIT'
  s.version = DeviseEncryptableAes::VERSION

  s.extra_rdoc_files = %w[README.md]

  s.add_dependency('aes', '~> 0.5.1')
  s.add_dependency('devise', '~> 4.9')
  s.add_dependency('devise-encryptable', '~> 0.2.0')
end
