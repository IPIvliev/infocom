# encoding: utf-8
class StaticPagesController < ApplicationController
  def index
  end

  def mail_to
    @new = params[:mail]
    MarketingMailer.kp_email(@new).deliver
    flash[:success] = 'Коммерческое предложение успешно отправленно на '+@new
    redirect_to root_path
  end

  def contacts
  end

  def services
  end

  def about_us
  end

  def articles
    @posts = Post.paginate(page: params[:page], :per_page => 3).order("created_at DESC")
  end

  def help
  end

  def it_autsorsing
render :template => "/static_pages/services/it_autsorsing"
  end

  def it_audit
render :template => "/static_pages/services/it_audit"
  end

  def sait
render :template => "/static_pages/services/sait"
  end

  def local
render :template => "/static_pages/services/local"
  end

  def printers
render :template => "/static_pages/services/printers"
  end

  def servers
render :template => "/static_pages/services/servers"
  end
end
