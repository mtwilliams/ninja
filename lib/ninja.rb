# ===-- lib/ninja.rb -------------------------------------*- mode: Ruby -*-=== #
#
#                            _____ _       _
#                           |   | |_|___  |_|___
#                           | | | | |   | | | .'|
#                           |_|___|_|_|_|_| |__,|
#                                       |___|
#
#        This file is distributed under the terms described in LICENSE.
#
# ===----------------------------------------------------------------------=== #

module Ninja
  require 'ninja/version'
  require 'ninja/delegator'
  require 'ninja/variable'
  require 'ninja/rule'
  require 'ninja/build'
  require 'ninja/file'
end
