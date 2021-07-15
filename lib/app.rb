require 'nokogiri'
require 'open-uri'
require "pry"
page = Nokogiri::HTML(URI.open('https://coinmarketcap.com/all/views/all/'))

arr_names =[]

#//*[@class="sc-1kxikfi-0 fjclfm cmc-table__column-name"]

arr_value = []

20.times { |i|
    page.xpath("//*[@id='__next']/div[1]/div[2]/div/div[1]/div/div[2]/div[3]/div/table/tbody/tr[#{i+1}]/td[2]/div/a[2]").map {|m| arr_names.push(m.content) }
    page.xpath("//*[@id='__next']/div[1]/div[2]/div/div[1]/div/div[2]/div[3]/div/table/tbody/tr[#{i+1}]/td[5]/div/a").map{|m| arr_value << m.content[1..-1].sub(/[","]/, '').to_f }
}

arr_result = []

arr_result << Hash[arr_names.zip(arr_value)]
puts arr_result

