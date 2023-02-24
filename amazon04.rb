#frozen_string_literal: true

require 'selenium-webdriver'
require_relative './account_reader'

abort 'account file not specified.' unless ARGV.size == 1
account = read_account(ARGV[0])

driver = Selenium::WebDriver.for :chrome
driver.get 'https://www.amazon.co.jp/'
element = driver.find_element(:id, 'nav-link-accountList')
puts element.text
element.click
element = driver.find_element(:id, 'ap_email')
element.send_keys(account[:email])
# send_keysを使って、表示要素のテキストフィールドにaccountから読みだしたメールアドレスを入力した
element = driver.find_element(:id,'continue')
element.click
sleep 3
driver.quit