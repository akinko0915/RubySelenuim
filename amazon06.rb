#frozen_string_literal: true

require 'selenium-webdriver'
require_relative './account_reader'

abort 'account file not specified.' unless ARGV.size == 1
account = read_account(ARGV[0])

driver = Selenium::WebDriver.for :chrome
wait = Selenium::WebDriver::Wait.new(timeout: 60)

driver.get ('https://www.amazon.co.jp/')
element = driver.find_element(:id, 'nav-link-accountList')
puts element.text
element.click
wait.until{driver.find_element(:id, 'ap-email').displayed?}
puts driver.title
element.click
element = driver.find_element(:id, 'ap-email')
element.send_keys(account[:email])
element = driver.find_element(:id, 'continue')
element.click
wait.until { driver.find_element(:id, 'ap-password').displayed?}
element = driver.find_element(:id, 'ap-password')
element.send_keys(account[:password])
element = driver.find_element(:id, 'signInSubmit')
element.click
wait.until {driver.find_element(:id, 'nav-link-accountList').displayed?}
# driver.switch_to.frame('nav-tools');
# driver.switch_to.frame('nav-orders');
driver.find_element(:id, 'nav-orders')
element.click
driver.get ("https://www.amazon.co.jp/gp/css/order-history")
wait.until {driver.find_element(:id, 'navFooter').displayed?}
# 注文履歴ページに遷移したのを確認するために、idがnavFooterの表示要素が表示されるのを待っている
puts driver.title
#　遷移したページを確認するために、タイトルを取得して表示した
sleep 3
driver.quit