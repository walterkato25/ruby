class LongTask < Task
	validates :percentage, presence: true , :numericality => { :greater_than_or_equal_to => 0, :less_than_or_equal_to => 100 }
	validates :description, presence: true
end
