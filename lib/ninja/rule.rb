module Ninja
  class Rule
    attr_reader :name,
                :command,
                :dependencies

    def initialize(desc={})
      Description.validate!(desc)

      @name = desc[:name]
      @command = desc[:command]
      @dependencies = desc[:dependencies]
    end

    module Description #:nodoc:
      def self.validate!(desc)
        # This might be overkill, but we want this to be idiot-proof.
        raise "Name not specified." unless desc.include?(:name)
         raise "Expected name to be a string composed of [a-Z,0-9,-,_] characters." unless /\A([-\w]+?)+\z/.match(desc[:name])

        raise "Command not specified." unless desc.include?(:command)
         raise "Input not used by the command." unless desc[:command].include? '$in'
         raise "Output not used by the command." unless desc[:command].include? '$out'

        if desc[:dependencies]
          if desc[:dependencies].is_a?(String)
          elsif desc[:dependencies].is_a?(Symbol)
            raise "Unknown or unsupported dependency auto-detection method: '#{desc[:dependencies]}'." unless [:gcc, :clang, :msvc].include?(desc[:dependencies])
          else
            raise "Expected dependencies to be name or auto-detection method."
          end
        end
      end
    end
  end
end
