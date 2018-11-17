module AnimesHelper
	def previous_season current_season
		cur_s = current_season.split(' ')[0]
		year = current_season.split(' ')[1].to_i
		case cur_s
		when "Fall"
			pre_s = "Summer"
		when "Summer"
			pre_s = "Spring"
		when "Spring"
			pre_s = "Winter"
		when "Winter"
			pre_s = "Fall"
			year = year - 1
		end
		return pre_s + ' ' + year.to_s
	end

	def next_season current_season
		cur_s = current_season.split(' ')[0]
		year = current_season.split(' ')[1].to_i
		case cur_s
		when "Winter"
			pre_s = "Spring"
		when "Spring"
			pre_s = "Summer"
		when "Summer"
			pre_s = "Fall"
		when "Fall"
			pre_s = "Winter"
			year = year + 1
		end
		return pre_s + ' ' + year.to_s
	end
end
