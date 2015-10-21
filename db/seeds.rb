1.times do 
  user = User.new(
    name:   "member",
    email:  "member@example.com",
    password: "helloworld"
    )

  user.skip_confirmation!
  user.save!
end


1.times do 
  item = Wiki.create!(
  user:  User.first,
  title:  "wiki 1",
  body: "This is the first wiki that I have created as a test",
  private: false,
  created_at: rand(10.minutes .. 1.year).ago
  )

end

1.times do 
  item = Wiki.create!(
  user:  User.first,
  title:  "wiki 2",
  body: "This is the second wiki that I have created as a test",
  private: false,
  created_at: rand(10.minutes .. 1.year).ago
  )

end


puts "Seed finished"
puts "#{Wiki.count} Wikis created"
