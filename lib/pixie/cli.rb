require_relative 'params'
require_relative 'images/compare'

module Pixie

	# @method compare(expected_image_file_path, actual_image_file_path, options={})
    # @param expected_image_file_path [String] 
    # @param actual_image_file_path [String]
    # @parm args [Hash]
    # @return [String] -- file path of the diff.png file

	def compare(expected, actual, args={})
		images = manage_paths(expected,actual)
		options = manage_options(args)
		create_pixie_report_dir
  		Compare.new.compare_images(images,options)
	end


	# @method resize_n_compare(expected_image_file_path, actual_image_file_path, options={})
    # @param expected_image_file_path [String] 
    # @param actual_image_file_path [String]
    # @params args [Hash]
    # @return [String] -- file path of the diff.png file

	def resize_n_compare(expected, actual, args={})
		images = manage_paths(expected,actual)
		options = manage_options(args)
		create_pixie_report_dir
  		Compare.new.resize_n_compare_images(images,options)
	end
end