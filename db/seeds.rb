# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

srand(123454321)
BASE_MULTIPLIER = 10


USERS_MULTIPLIER = 10
POSTS_MULTIPLIER = 15
FOLLOW_MULTIPLIER = 7


# Create Users
(USERS_MULTIPLIER * BASE_MULTIPLIER).times do
  User.create(name: Faker::Name.name)
end

# Users follow each other
User.all.each do |user|
  rand(2..(FOLLOW_MULTIPLIER * BASE_MULTIPLIER)).times do
    rand_user = User.all.sample
    user.followed_users << rand_user unless user.followed_users.include?(rand_user) || user == rand_user
  end
end

# Users create posts
User.all.each do |user|
  rand(2..(POSTS_MULTIPLIER * BASE_MULTIPLIER)).times do
    user.posts.create(body: Faker::Lorem.sentence(4,true))
  end
end

