class SimpleTask < Task
	validates :description, presence: true,
						length: { minimum:5 }
	

end
