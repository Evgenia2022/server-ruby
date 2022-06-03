require 'faker'

puts 'Start adding seeds to the database...'

11.times do
  user = User.create(
    full_name: Faker::Name.name,
    email: Faker::Internet.email
  )

  5.times do
    post = Post.create(
      title: Faker::Book.title,
      content: Faker::Books::Lovecraft.sentence,
      user_id: user.id
    )

    3.times do
      Comment.create(
        content: Faker::Lorem.sentence,
        user_id: user.id,
        post_id: post.id
      )
    end
  end
end

puts 'Seeds successfully added to the database!'