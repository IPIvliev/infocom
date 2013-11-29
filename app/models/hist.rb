# encoding: utf-8

class Hist < ActiveRecord::Base
  attr_accessible :request_id, :date, :status

  belongs_to :request

  def period
  	return "<strong class=red>Исполнение заявки отменено</strong>" if status == 1
  	return "<strong class=green>Заявка исполнена</strong>" if status == 2
  	return "<strong class=red>Отказ исполнителя от заявки</strong>" if status == 5
  	return "<strong class=blue>Определён исполнитель</strong>" if status == 6
  	return "<strong>Подача заявки</strong>" if status == 3
	return "<strong class=yellow>Заявка отработана</strong>" if status == 7

  end

end
