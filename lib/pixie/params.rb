require 'pathname'
require 'yaml'

module Pixie

	def manage_paths(expected,actual)
		images = {}
		expected = Pathname.new(expected)
		actual = Pathname.new(actual)
		if expected.relative?
			images[:expected] = expected.realpath
		end
		if actual.relative?
			images[:actual] = actual.realpath
		end
		images
	end

	def manage_options(args=[])
		options = YAML.load_file(File.absolute_path("defaults.yml", "data"))
		args.each do |arg|
			if arg.downcase.include?("--fuzz")
				options[:fuzz] = arg.downcase.split("=").last
			elsif arg.downcase.include?("--threshold")
				options[:threshold] = arg.downcase.split("=").last
			elsif arg.downcase.include?("--color")
				options[:color] = arg.downcase.split("=").last
			else
				console_log("Unrecognised option `#{arg}`, defaults will be applied.")
			end
		end 
		return options
	end

	def create_pixie_report_dir
		Dir.mkdir("pixie_report") unless Dir.exists?("pixie_report")
	end

	def create_compare_execution_dir(dir_name)
		create_pixie_report_dir
		Dir.mkdir("pixie_report/#{dir_name}")
	end

end
