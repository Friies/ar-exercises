require_relative '../setup'
require_relative './exercise_1'
require_relative './exercise_2'
require_relative './exercise_3'
require_relative './exercise_4'
require_relative './exercise_5'
require_relative './exercise_6'

=begin
Exercise 7: Validations for both models
  1. Add validations to two models to enforce the following business rules:
  - Employees must always have a first name present
  - Employees must always have a last name present
  - Employees have a hourly_rate that is a number (integer) between 40 and 200
  - Employees must always have a store that they belong to (can't have an employee that is not assigned a store)
  - Stores must always have a name that is a minimum of 3 characters
  - Stores have an annual_revenue that is a number (integer) that must be 0 or more
  - BONUS: Stores must carry at least one of the men's or women's apparel (hint: use a custom validation method - don't use a Validator class)
  2. Ask the user for a store name (store it in a variable)
  3. Attempt to create a store with the inputted name but leave out the other fields (annual_revenue, mens_apparel, and womens_apparel)
  4. Display the error messages provided back from ActiveRecord to the user (one on each line) after you attempt to save/create the record
=end


puts "Exercise 7"
puts "----------"

puts "Enter a store name:"
store_name = gets.chomp

puts "Enter a annual revenue:"
annual_revenue = gets.chomp

puts "Does the store carry men apparel? (true/false)"
mens_apparel = gets.chomp.downcase == 'true'

puts "Does the store carry women apparel? (true/false)"
womens_apparel = gets.chomp.downcase == 'true'

new_store = Store.new(
  name: store_name,
  annual_revenue: annual_revenue,
  mens_apparel: mens_apparel,
  womens_apparel: womens_apparel
)

if new_store.save
  puts "New store #{new_store.name} created successfully!"
  puts 
else
  puts "Error occured during store creation:"
  new_store.error.full_messages.each do |error| 
    puts "- #{error}"
  end
end
