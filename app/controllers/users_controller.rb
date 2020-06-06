class UsersController < ApplicationController
  def index
    @users = [
      User.new(
        id: 1,
        name: 'Vadim',
        username: 'installero',
        avatar_url: 'https://secure.gravatar.com/avatar/' \
          '71269686e0f757ddb4f73614f43ae445?s=100'
      ),
      User.new(id: 2, name: 'Misha', username: 'aristofun')
    ]
  end

  def new
  end

  def edit
  end

  def show
    @user = User.new(
      name: "Dmitry",
      username: "xaero",
      avatar_url: "https://i.pinimg.com/originals/2f/0c/fa/2f0cfa9cf4cf82c8a97c3576d2024684.jpg"
    )

    @questions = [
      Question.new(text: "Как дела?", created_at: Date.parse("06.06.2020")),
      Question.new(text: "Шо делать?", created_at: Date.parse("06.06.2020"))
    ]

    @new_question = Question.new
  end
end
