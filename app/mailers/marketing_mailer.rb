# encoding: utf-8

class MarketingMailer < ActionMailer::Base
  default from: "infocom-nn@yandex.ru"



  def kp_email(mail)

  	attachments["kp_infocom_nn.pdf"] = File.read('public/kp_infocom_nn.pdf', :mode => 'rb')

    mail(to: mail, subject: 'Коммерческое предложение по ИТ-аутсорсингу от Инфоком-НН')
  end
end