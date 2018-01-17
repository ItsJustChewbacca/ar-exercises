require_relative '../setup'

puts "Exercise 1"
puts "----------"

# Your code goes below here ...
require 'pg'
require 'active_record'



puts "------------------------------------"
puts Store.count

class Store < ActiveRecord::Base
  has_many :employees
  validates :name, length: {in: 3..30}
  validates :annual_revenue, inclusion: (0..10000000000)
  $store1 = Store.create(name: 'Burnaby', annual_revenue: 300000, mens_apparel: true, womens_apparel: true)
  $store2 = Store.create(name: 'Richmond', annual_revenue: 126000, mens_apparel: false, womens_apparel: true)
  $store3 = Store.create(name: 'Gastown', annual_revenue: 190000, mens_apparel: true, womens_apparel: false)
  $store4 = Store.create(name: 'Surrey', annual_revenue: 224000, mens_apparel: false, womens_apparel: true)
  $store5 = Store.create(name: 'Whistler', annual_revenue: 1900000, mens_apparel: true, womens_apparel: false)
  $store6 = Store.create(name: 'Yaletown', annual_revenue: 430000, mens_apparel: true, womens_apparel: true)
  puts "enter store location: LOCATION MUST BE LONGER THAN THREE CHARACTERS"
  @user_store_name = gets.chomp
  user_created_store = Store.create(name: @user_store_name, annual_revenue: 350000, mens_apparel:true, womens_apparel: true)
  user_created_store.errors.messages.each {|error| puts "#{error[0].capitalize} has caused an error: #{error[1]}"}
  puts Store.count

  @store1 = Store.find(1)
  pp @store1
  @store2 = Store.find(2)
  pp @store2
  @store3 = Store.find(3)
  pp @store3
  @store3.destroy
  pp@store3
  @store1.update(name: "Vancouver")
  pp @store1
  @mens_stores = Store.where mens_apparel: true
  pp @mens_stores
  @mens_stores.each {|e| puts e[:name], e[:annual_revenue]}
  pp
  @womens_apparel = Store.where womens_apparel: true, annual_revenue: (1..999999)
  pp @womens_apparel
  @summed = Store.sum(:annual_revenue)
  pp @summed
  @averaged = @summed / Store.count
  pp @averaged
  @high_annual_sales = Store.where annual_revenue:(1000000..2000000000)
  pp @high_annual_sales.count

end

puts Store.count

class Employee < ActiveRecord::Base
  belongs_to :store
  validates :store, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :hourly_rate, inclusion: (40..200)


  $store1.employees.create(first_name: "Luke", last_name: "Grossmann", hourly_rate: 200)
  $store1.employees.create(first_name: "Ben", last_name: "H", hourly_rate: 40)
  $store1.employees.create(first_name: "Tom", last_name: "K", hourly_rate: 40)
  $store2.employees.create(first_name: "Ewok", last_name: "Ewokie", hourly_rate: 150 )
  $store2.employees.create(first_name: "Chewbacca", last_name: "Chewy", hourly_rate: 100)
  $store2.employees.create(first_name: "Bob", last_name: "B", hourly_rate: 40)
end



