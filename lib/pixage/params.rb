require 'pathname'
require 'yaml'

module Pixage

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
				options[:fuzz] = val.to_i
			elsif key.downcase == :threshold
				options[:threshold] = val.to_i
			elsif key.downcase == :color
				options[:color] = val.to_s.downcase
			elsif key.downcase == :resize
				options[:resize] = val.to_s.downcase
			elsif key.downcase == :force
				options[:force] = val.to_s.downcase
			else
				console_log("Unrecognised option `--#{key}=#{val}`, defaults will be applied.", :warning)
			end
		end
		return options
	end

	def create_pixage_report_dir
		Dir.mkdir("pixage_report") unless Dir.exists?("pixage_report")
	end

	def create_compare_execution_dir(dir_name)
		create_pixage_report_dir
		Dir.mkdir("pixage_report/#{dir_name}")
	end

end
