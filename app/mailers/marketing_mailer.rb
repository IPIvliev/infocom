# encoding: utf-8

class MarketingMailer < ActionMailer::Base
  default from: "cccp1945@mail.ru"



  def kp_email(mail)

  	attachments["kp_infocom_nn.docx"] = File.read('public/kp_infocom_nn.docx', :mode => 'rb')

    mail(to: mail, subject: 'Проверка работы почты')
  end
end