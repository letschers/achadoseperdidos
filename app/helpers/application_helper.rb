module ApplicationHelper

	def menuActive(entry)
		request.path.include?(entry) ? "active" : " "

	end
end
