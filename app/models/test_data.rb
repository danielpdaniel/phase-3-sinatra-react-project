class TestData < ActiveRecord::Base
    def say_test
        "Test ID: #{self.id} this is to test getting instance methods returned with the json data through the application controller!"
    end

    def self.say_class_test
        "This is a class method for the #{self} class!"
    end
end