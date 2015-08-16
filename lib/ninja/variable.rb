module Ninja
  class Variable
    attr_reader :name,
                :value

    def initialize(name, value)
      raise "Name not specified." unless name
       raise "Expected name to be a string made of [a-Z,_,-,0-9] characters." unless /\w/.match(name)

      @name = name
      @value = value
    end
  end
end
