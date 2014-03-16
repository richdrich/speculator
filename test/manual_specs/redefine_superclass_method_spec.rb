require 'rspec'

module RedefineSuperclassMethod

  class A
    @test_mode = nil

    def self.testing(mode)
      @test_mode = mode
    end

    def self.class_method
      puts "original method\n"

      fail('original method called when redefined') if @test_mode==:redefined
    end
  end

  class B < A
    def self.caller
      puts "caller\n"
      self.class_method
    end
  end


  describe 'A superclass' do

    it 'should run original when no redefine' do
      A.testing :original

      B.caller
    end

    it 'should run redefined when redefined' do
      A.testing :redefined

      def_target = (class << A; self; end)

      def_target.send(:define_method, :class_method) do
        puts "changed_method\n"
        fail('changed method called when original') if @test_mode==:original
      end

      B.caller
    end
  end
end
