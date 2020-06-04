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
      avatar_url: "https://i.pinimg.com/originals/2f/0c/fa/2f0cfa9cf4cf82c8a97c3576d2024684.jpg"
    )
  end
end
