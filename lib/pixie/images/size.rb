require 'mini_magick'
require_relative '../logger'

module Pixie

	def check_sizes(images)
		expected = MiniMagick::Image.new(images[:expected])
		actual = MiniMagick::Image.new(images[:actual])
		size_check = expected.dimensions != actual.dimensions
		if size_check
			console_log("Warning: Image sizes are not equal, the generated diff might be misleading, please use : ", :warning)
			console_log("pixie resize_n_compare\n", :pass)
		end
		return size_check
	end

	def resize_images(expect, actual)
		
	end

end