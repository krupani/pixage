require 'mini_magick'
require_relative '../logger'

module Pixie

	class Convert

		def check_sizes(images)
			expected = MiniMagick::Image.new(images[:expected])
			actual = MiniMagick::Image.new(images[:actual])
			expected.dimensions != actual.dimensions
		end

		def resize_images(images,options={:resize => "desc", :force => "false"})
			expected = MiniMagick::Image.new(images[:expected])
			actual = MiniMagick::Image.new(images[:actual])
			switch = 0
			if options[:resize]=="desc"
				switch = expected.dimensions <=> actual.dimensions
			elsif options[:resize]=="asc"
				switch = actual.dimensions <=> expected.dimensions
			end

			case switch
			when 1
				if options[:force]=="true"
					expected.resize(actual.dimensions.join('x')+"!")
				else
					expected.resize(actual.dimensions.join('x'))
				end
			when -1
				if options[:force]=="true"
					actual.resize(expected.dimensions.join('x')+"!")
				else
					actual.resize(expected.dimensions.join('x'))
				end
			end
		end
		
	end	

end