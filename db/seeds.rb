User.create!(email: "default@user.com", password: "password")

10.times do
  user = User.create(email: Faker::Internet.email, password: "test@password")
  5.times do
    resource = user.resources.create(title: Faker::Lorem.sentence(word_count: 4), description: Faker::Lorem.paragraph(sentence_count: 5), resource_link: Faker::Internet.url)
    5.times do
      resource.categories.create(category_name: Faker::Hacker.verb, category_type:Faker::Hacker.adjective)
      resource.tags.create(tag_name: Faker::ProgrammingLanguage.name)
    end
  end
end