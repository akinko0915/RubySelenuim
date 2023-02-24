# frozen_string_literal:true

require 'selenium-webdriver'

driver = Selenium::WebDriver.for :chrome
driver.get 'https://www.amazon.co.jp/'
element = driver.find_element(:id, 'nav-link-accountList')
puts element.text
# 見つけたelementの文字列表現を表示した
driver.quit
# quitを使って、WebDriverを終了した

