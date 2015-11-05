require 'faker'


1.times do 
  user = User.new(
    name:   "member1",
    email:  "member1@example.com",
    password: "helloworld",
    role: "standard"
    )

  user.skip_confirmation!
  user.save!
end

1.times do 
  user = User.new(
    name:   "member2",
    email:  "member2@example.com",
    password: "helloworld",
    role: "standard"
    )

  user.skip_confirmation!
  user.save!
end

1.times do 
  user = User.new(
    name:   "member3",
    email:  "member3@example.com",
    password: "helloworld",
    role: "standard"
    )

  user.skip_confirmation!
  user.save!
end

1.times do 
  user = User.new(
    name:   "member4",
    email:  "member4@example.com",
    password: "helloworld",
    role: "standard"
    )

  user.skip_confirmation!
  user.save!
end

1.times do 
  user = User.new(
    name:   "admin",
    email:  "admin@example.com",
    password: "helloworld",
    role: "admin"
    )

  user.skip_confirmation!
  user.save!
end

users = User.all
options = [true, false]
50.times do
   Wiki.create!(
     title:  Faker::Lorem.sentence,
     body:   Faker::Lorem.paragraph,
     user:   users.sample,
     private: options.sample
   )
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
