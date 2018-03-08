require 'colorize'

module Pixie

	def console_log(text, status, loud=false)
		text=text.upcase if loud
		case status.downcase.to_sym
		when :warning
			puts text.yellow
		when :error, :exception
			puts text.red
		when :pass, :success
			puts text.green
		else
			puts text
		end
	end

end