require 'sass'

module Sass
  module Script::Functions
    COMMA_SEPARATOR = /\s*,\s*/
    def nest(*arguments)
      nested = arguments.map{|a| a.value}.inject do |memo,arg|
        ancestors = memo.split(COMMA_SEPARATOR)
        descendants = arg.split(COMMA_SEPARATOR)
        ancestors.map{|a| descendants.map{|d| "#{a} #{d}"}.join(", ")}.join(", ")
      end
      Sass::Script::String.new(nested)
    end
  end

  module Tree
    class MixinDefNode < Node
      attr_accessor :name, :args
    end
  end
end
