# frozen_string_literal:true

require 'selenium-webdriver'

proxy = Slenium::WebDriver::Proxy.new(http:'140.227.229.208:3128')
caps = Selenium::WebDriver::Remote::Capabilities.chrome(proxy: proxy)

driver = Selenium::WebDriver.for(:chrome, desired_capabilities: caps)
driver.get 'https://rainypower.jp/'

