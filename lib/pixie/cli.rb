require_relative 'params'
require_relative 'images/compare'

module Pixie

	def compare_images(expected, actual, args=[])
		images = manage_paths(expected,actual)
		options = manage_options(args)
		create_pixie_report_dir
  		Compare.new.compare(images,options)
	end

	def resize_n_compare_images()

	end
end