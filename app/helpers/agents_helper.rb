# encoding: utf-8

module AgentsHelper


	def aday(days)
		days + 1.year
	end

def daystoyear(days)
date = ((days + 1.year) - Date.today).to_i
plural = Russian.pluralize(date, "день", "дня", "дней")

"#{date} #{plural}"
end


end
