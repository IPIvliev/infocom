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
      flash[:success] = "Поздравляем Вас с успешной регистрацией. Теперь Вы можете подать заявку"
      redirect_to agents_path
    else
      flash.now[:error] = 'Регистрация не удалась. Вы не заполнили, либо не правильно заполнили одно из полей.'
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
