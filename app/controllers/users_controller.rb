class UsersController < ApplicationController
  def index
  end

  def new
  end

  def edit
  end

  def show
    @user = User.new(
      name: "Dmitry",
      username: "xaero",
      avatar_url: "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/a2a143cd-ef7d-44b1-acea-4bfca8f719af/d8ewyyb-6748015c-f635-4a3b-b908-2823ff77645b.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOiIsImlzcyI6InVybjphcHA6Iiwib2JqIjpbW3sicGF0aCI6IlwvZlwvYTJhMTQzY2QtZWY3ZC00NGIxLWFjZWEtNGJmY2E4ZjcxOWFmXC9kOGV3eXliLTY3NDgwMTVjLWY2MzUtNGEzYi1iOTA4LTI4MjNmZjc3NjQ1Yi5qcGcifV1dLCJhdWQiOlsidXJuOnNlcnZpY2U6ZmlsZS5kb3dubG9hZCJdfQ.NicR9NUmB6iqTlFsV_e1QzGijN1hDN25BYxPjEI8YhU"
    )
  end
end
