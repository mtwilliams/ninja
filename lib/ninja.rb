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
  require_relative 'ninja/version'
  require_relative 'ninja/delegator'
  require_relative 'ninja/variable'
  require_relative 'ninja/rule'
  require_relative 'ninja/build'
  require_relative 'ninja/file'
end
