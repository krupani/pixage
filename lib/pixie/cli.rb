require_relative 'params'
require_relative 'images/compare'

module Pixie

	def compare(expected, actual, args={})
		images = manage_paths(expected,actual)
		options = manage_options(args)
		create_pixie_report_dir
  		Compare.new.compare_images(images,options)
	end

	def resize_n_compare(expected, actual, args={})
		images = manage_paths(expected,actual)
		options = manage_options(args)
		create_pixie_report_dir
  		Compare.new.resize_n_compare_images(images,options)
	end
end