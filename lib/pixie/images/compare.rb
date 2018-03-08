require 'mini_magick'
require_relative 'size'
require_relative '../params'


module Pixie

	class Compare

		def compare(images,options)
			check_sizes(images)
			execution_dir = Time.now.strftime("%d-%b-%y-%H-%M-%S")
			create_compare_execution_dir(execution_dir)
			cmd = "compare -dissimilarity-threshold #{options[:threshold]} -fuzz #{options[:fuzz]} -metric AE -highlight-color #{options[:color]} #{images[:expected]} #{images[:actual]} pixie_report/#{execution_dir}/diff.png"
			execute_command(cmd)
		end

		def execute_command(cmd)
			require 'open3'
			cmd_out = Open3.popen3(cmd)[2].read
		end

		private :execute_command
	end
end