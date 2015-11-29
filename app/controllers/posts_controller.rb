# encoding: utf-8

class PostsController < ApplicationController
 def index
    @posts = Post.paginate(page: params[:page], :per_page => 20).order("created_at DESC")
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
      flash[:success] = "Вы успешно опубликовали сообщение! Спасибо за публикацию."
      redirect_to posts_path
    else
      flash.now[:error] = 'Публикация отклонена. Вы не заполнили название, либо содержание статьи.'
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
    flash[:success] = "Сообщение уничтожено."
    redirect_to posts_path
  end
end
