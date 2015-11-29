# encoding: utf-8

class EmailsController < ApplicationController

def index
    @emails = Email.paginate(page: params[:page], :per_page => 10).order("created_at DESC")
end

def destroy
    Email.find(params[:id]).destroy
    flash[:success] = "Пользователь уничтожен."
    redirect_to emails_url
end

end
