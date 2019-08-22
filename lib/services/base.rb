class Services::Base
  include Virtus.model

  def self.call(*args,  &block)
    new(*args,  &block).call
  end

  def perform
    raise "You must override #perform in class #{self.class}"
  end

  #  Wrapper for performing the action
  #
  def call(*params, &block)
    perform(*params, &block)
  end
end