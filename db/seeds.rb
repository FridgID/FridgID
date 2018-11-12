puts "destroy users..."
User.destroy_all

puts "create test user..."
User.create!(email: 'test@test.com', password: 'password')
