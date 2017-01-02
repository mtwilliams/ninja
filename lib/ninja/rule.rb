module Ninja
  class Rule
    attr_reader :name,
                :command,
                :dependencies,
                :response_file

    def initialize(desc={})
      Description.validate!(desc)

      @name = desc[:name]
      @command = desc[:command]
      @dependencies = desc[:dependencies]
      @response_file = desc[:response_file]
    end

    module Description #:nodoc:
      def self.validate!(desc)
        # This might be overkill, but we want this to be idiot-proof.
        raise "Name not specified." unless desc.include?(:name)
         raise "Expected name to be a string composed of [a-Z,0-9,-,_] characters." unless /\A([-\w]+?)+\z/.match(desc[:name])

        raise "Command not specified." unless desc.include?(:command)
         # TODO(mtwilliams): Check response file.
         # raise "Input not used by the command." unless desc[:command].include? '$in'
         # raise "Output not used by the command." unless desc[:command].include? '$out'

        if desc[:dependencies]
          if desc[:dependencies].is_a?(String)
          elsif desc[:dependencies].is_a?(Symbol)
            raise "Unknown or unsupported dependency auto-detection method: '#{desc[:dependencies]}'." unless [:gcc, :clang, :msvc].include?(desc[:dependencies])
          else
            raise "Expected dependencies to be name or auto-detection method."
          end
        end

        if desc[:response_file]
          raise "Expected a `Ninja::Responsefile`." unless desc[:response_file].is_a?(ResponseFile)
        end
      end
    end
  end
end
