# encoding: utf-8

class AgentsController < ApplicationController
  def index
    @agents = Agent.paginate(page: params[:page])
  end

  def show
    @agent = Agent.find(params[:id])
  end

  def new
    @agent = Agent.new
  end

    def create
    @agent = Agent.new(params[:agent])
    if @agent.save
      flash[:success] = "Новая компания успешно зарегистрированна."
      redirect_to agents_path
    else
      flash.now[:error] = "Регистрация компании не удалась."
      render 'new'
    end
  end

  def edit
    @agent = Agent.find(params[:id])
  end

  def update
  	@agent = Agent.find(params[:id])
    if @agent.update_attributes(params[:agent])
      flash[:success] = "Данные обновлены."
      redirect_to agents_path
    else
      render 'edit'
    end
  end

   def destroy
    Agent.find(params[:id]).destroy
    flash[:success] = "Пользователь уничтожен."
    redirect_to agents_path
  end

end
