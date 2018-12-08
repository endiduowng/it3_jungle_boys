class Date
	def to_seasons
		case self.month
		when 1,2,3
			return "Spring #{self.year}"
		when 4,5,6
			return  "Summer #{self.year}"
		when 7,8,9
			return  "Fall #{self.year}"
		when 10,11,12
			return "Winter #{self.year}"
		end
	end
end
