FactoryBot.define do
  factory(:user) do
    user_name("Bob")
    email("bob@bob.com")
    password("bob123")
    password_confirmation("bob123")
    admin(true)
  end

  factory(:comment) do
    user
    content("This is a test comment for the testing of comments.")
  end
  factory(:cat) do

    name("Test Cat")
    about("This is about a cat.")
    traits("These, Are, Traits")
    price(20.00)
  end
end
