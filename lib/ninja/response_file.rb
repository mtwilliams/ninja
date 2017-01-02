module Ninja
  class ResponseFile
    attr_reader :name,
                :contents

    def initialize(name, contents)
      raise "Name not specified." unless name

      @name = name
      @contents = contents
    end
  end
end
