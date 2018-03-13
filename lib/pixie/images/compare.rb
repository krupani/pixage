require 'mini_magick'
require 'fileutils'
require 'pathname'
require_relative 'convert'
require_relative '../params'
require_relative '../logger'

module Pixie

	class Compare

		def compare_images(images,options)
			convert = Convert.new()
			if convert.check_sizes(images)
				console_log("Warning: Image sizes are not equal, the generated diff might be misleading, please use : ", :warning)
				console_log("pixie resize_n_compare\n", :pass)
			end
			execution_dir = Time.now.strftime("%d-%b-%y-%H-%M-%S")
			create_compare_execution_dir(execution_dir)
			cmd = "compare -dissimilarity-threshold #{options[:threshold]} -fuzz #{options[:fuzz]} -metric AE -highlight-color #{options[:color]} #{images[:expected]} #{images[:actual]} pixie_report/#{execution_dir}/diff.png"
			execute_command(cmd)
			Pathname.new("pixie_report/#{execution_dir}/diff.png").realpath.to_s
		end

		def resize_n_compare_images(images,options)
			convert = Convert.new()
			execution_dir = Time.now.strftime("%d-%b-%y-%H-%M-%S")
			create_compare_execution_dir(execution_dir)
			images = make_copies(images, "pixie_report/#{execution_dir}")
			convert.resize_images(images,options[:resize])
			cmd = "compare -dissimilarity-threshold #{options[:threshold]} -fuzz #{options[:fuzz]} -metric AE -highlight-color #{options[:color]} #{images[:expected]} #{images[:actual]} pixie_report/#{execution_dir}/diff.png"
			execute_command(cmd)
			Pathname.new("pixie_report/#{execution_dir}/diff.png").realpath.to_s
		end

		def execute_command(cmd)
			require 'open3'
			cmd_out = Open3.popen3(cmd)[2].read
		end

		def make_copies(images,path)
			ts = Time.now.to_i
			expected = Pathname.new(path+"/expected_#{ts}#{File.extname(images[:expected])}")
			actual = Pathname.new(path+"/actual_#{ts}#{File.extname(images[:actual])}")
			FileUtils.cp(images[:expected], expected)
			FileUtils.cp(images[:actual], actual)
			{:expected => expected.realpath, :actual => actual.realpath}
		end

		private :execute_command, :make_copies
	end
end