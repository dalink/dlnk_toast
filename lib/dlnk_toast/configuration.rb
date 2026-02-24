module DlnkToast
  class Configuration
    attr_accessor :duration

    def initialize
      @duration = 4000
    end
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure
    yield(configuration)
  end
end
