# encoding: utf-8

class PostsController < ApplicationController
 def index
    @posts = Post.paginate(page: params[:page])
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

    def create
    @post = current_user.posts.build(params[:post])
    if @post.save
      flash[:success] = "Поздравляем Вас с успешной регистрацией. Теперь Вы можете подать заявку"
      redirect_to posts_path
    else
      flash.now[:error] = 'Регистрация не удалась. Вы не заполнили, либо не правильно заполнили одно из полей.'
      render 'new'
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
  	@post = Post.find(params[:id])
    if @post.update_attributes(params[:post])
      flash[:success] = "Данные обновлены."
      redirect_to @post
    else
      render 'edit'
    end
  end

   def destroy
    Post.find(params[:id]).destroy
    flash[:success] = "Пользователь уничтожен."
    redirect_to posts_path
  end
end
