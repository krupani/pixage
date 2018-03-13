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

	def manage_options(args={})
		options = YAML.load_file(File.join(File.dirname(__FILE__) + "/../../data/defaults.yml"))
		args.each do |key,val|
			if key.downcase == :fuzz
				options[:fuzz] = val.downcase
			elsif key.downcase == :threshold
				options[:threshold] = val.downcase
			elsif key.downcase == :color
				options[:color] = val.downcase
			elsif key.downcase == :resize
				options[:resize] = val.downcase
			else
				console_log("Unrecognised option `--#{key}=#{val}`, defaults will be applied.", :warning)
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
