module PsppRb
  class Variable
    class ValueLabel
      attr_accessor :value, :label

      def initialize(value, label)
        self.value = value
        self.label = label
      end

      def to_pspp
        "#{value} '#{label}'"
      end

      def to_s
        to_pspp
      end

      def inspect
        to_pspp
      end
    end
  end
end
