
# User seed
require 'faker'

50.times do
  User.create(name: Faker::Name.name, password: "password",
              username: Faker::Internet.email )
end

#Url seed

links = ['http://www.sinatrarb.com/intro#Filters', 'http://www.sinatrarb.com/faq.html#sessions', 
        'http://guides.rubyonrails.org/active_record_querying.html']

links.each do |url|
  Url.create(original: url, user_id: rand(1..50))
end

