require 'faker'

# Create Users
10.times do
  User.create!(
    username: Faker::Name.name,
    email: Faker::Internet.email,
    password: 'password'
  )
end
users = User.all
puts "#{User.count} users created."

# Create My User
unless User.find_by(email: "admin@email.com")
  admin = User.create!(
    username: "admin",
    email: "admin@email.com",
    password: "password"
  )
  puts "Created admin@email.com"
  puts "Email: #{admin.email} Password: #{admin.password}"
else
  puts "Skipped creation of \"admin@email.com\""
end

# Create Topics
10.times do
  Topic.create!(
    title: Faker::Lorem.characters(10),
    user_id: users.sample
  )
end
topics = Topic.all
puts "#{Topic.count} topics created."

# Create Bookmarks
50.times do
  Bookmark.create!(
    url: Faker::Internet.url,
    topic: topics.sample,
    user_id: users.sample
  )
end
bookmarks = Bookmark.all
puts "#{Bookmark.count} bookmarks created."

# Create Likes
20.times do
  Like.create!(
    user_id: users.sample,
    bookmark_id: bookmarks.sample
  )
end
likes = Like.all
puts "#{Like.count} likes created."
