module Ninja
  class Build
    attr_reader :rule,
                :inputs,
                :output

    def initialize(desc={})
      Description.validate!(desc)

      @rule = desc[:rule]
      @inputs = [*desc[:inputs]]
      @output = desc[:output]
    end

    module Description #:nodoc:
      def self.validate!(desc)
        # This might be overkill, but we want this to be idiot-proof.
        raise "Rule not specified." unless desc.include?(:rule)
         raise "Expected rule to be a string composed of [a-Z,0-9,-,_] characters." unless /\A([-\w]+?)+\z/.match(desc[:rule])

        raise "Inputs not specified." unless desc.include?(:inputs)
         # TODO(mtwilliams): Check type of elements.
         raise "Expected inputs to be an array of paths." unless desc[:inputs].is_a?(Array)
        raise "Output not specified." unless desc.include?(:output)
         # TODO(mtwilliams): Check if paths exist.
         raise "Expected output to be a path." unless desc[:output].is_a?(String)
      end
    end
  end
end
