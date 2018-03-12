require 'mini_magick'
require_relative '../logger'

module Pixie

	def check_sizes(images)
		expected = MiniMagick::Image.new(images[:expected])
		actual = MiniMagick::Image.new(images[:actual])
		expected.dimensions != actual.dimensions
	end

	def resize_images(images,resize="desc")
		expected = MiniMagick::Image.new(images[:expected])
		actual = MiniMagick::Image.new(images[:actual])
		switch = 0
		if resize=="desc"
			switch = expected.dimensions <=> actual.dimensions
		elsif resize=="asc"
			switch = actual.dimensions <=> expected.dimensions
		end

		case switch
		when 1
			expected.resize(actual.dimensions.join('x'))
		when -1
			actual.resize(expected.dimensions.join('x'))
		end
	end

end