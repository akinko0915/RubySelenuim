# frozen_string_literal:true

require 'selenium-webdriver'

driver = Selenium::WebDriver.for :chrome
driver.get 'https://www.amazon.co.jp/'
element = driver.find_element(:id, 'nav-link-accountList')
puts element.text
element.click
sleep 3
# クリックして遷移した画面をしばらく表示しておくためにsleepメソッドを使った。
driver.quit