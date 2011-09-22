module ApplicationHelper
# Returns a title if no title is present

	def title 
		base_title = ""
		if @title.nil?
			base_title
		else
			"#{base_title}#{@title}"
		
		end
	end

end
