# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

if User.all.empty?
	user = User.create!(email: "yuki@loldesign.com.br", password: "12341234", password_confirmation: "12341234")
	puts "User create #{user.email}" 
end

if Tester.all.empty?
	tester = Tester.create!(
												email: "fetks@loldesign.com.br",
												password: "12341234", 
												password_confirmation: "12341234", 
												age: 20, 
												gender: "female", 
												schooling: "graduated", 
												locale: "south", 
												role: "unemployed", 
												kind_of_disability: "blind"
												)
	puts "Tester create #{tester.email}" 
end
