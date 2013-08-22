# encoding: utf-8

class MarketingMailer < ActionMailer::Base
  default from: "cccp1945@mail.ru"

  def kp_email(mail)
    mail(to: mail, subject: 'Проверка работы почты')
  end
end
