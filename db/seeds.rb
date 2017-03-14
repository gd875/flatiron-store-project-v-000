10.times do
  Item.create(
    title: Faker::Commerce.product_name,
    inventory: Faker::Number.number(2),
    price: Faker::Number.number(4)
  )
  Category.create(title: Faker::Commerce.department)
end

counter = 1
Item.all.each do |item|
  item.category_id = counter
  item.save
  counter += 1
end

User.create(:email => "bob@example.com", :password => "12345678")
User.create(:email => "joe@example.com", :password => "12345678")
User.create(:email => "sam@example.com", :password => "12345678")
User.create(:email => "frank@example.com", :password => "12345678")
User.create(:email => "jane@example.com", :password => "12345678")
User.create(:email => "sally@example.com", :password => "12345678")
User.create(:email => "megan@example.com", :password => "12345678")
User.create(:email => "jason@example.com", :password => "12345678")
User.create(:email => "robert@example.com", :password => "12345678")
User.create(:email => "jill@example.com", :password => "12345678")