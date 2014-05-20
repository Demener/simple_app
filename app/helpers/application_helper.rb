module ApplicationHelper

	#returns the full title on a per page pasis
	def full_title(page_title)
		base_title = "Tutorial Sample App"
		if page_title.empty?
			base_title
		else
			"#{base_title} | #{page_title}"
		end
	end
end
