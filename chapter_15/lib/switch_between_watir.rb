module Watir
  class StartBrowser
    attr_accessor :browser_driver

    def initialize
      @browser_driver = 'Watir'
    end

    def start_browser
      puts "This would be an internet explorer browser using '#{@browser_driver}'."
    end
  end
end

module WatirWebdriver
  class StartBrowser
    attr_accessor :browser_driver

    def initialize
      @browser_driver = 'Watir-Webdriver'
    end
    def start_browser
      puts "This would be an internet explorer browser using '#{@browser_driver}'."
    end
  end
end
