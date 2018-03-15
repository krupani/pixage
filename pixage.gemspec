Gem::Specification.new do |s|
	s.name			=	"pixage"
	s.version		=	File.read(File.expand_path("../lib/pixage/version", __FILE__))
	s.description	=	"A visual regression utility with options to do single and bulk operations both manually and integrable with Selenium automated tests in Ruby."
	s.platform		= 	Gem::Platform::RUBY
	s.summary		=	"A visual regression utility with options to do single and bulk operations both manually and integrable with Selenium automated tests in Ruby."
	s.authors		=	["Kaushal Rupani"]
	s.email			=	["kushrupani@live.com"]
	s.files			= 	Dir.glob("{lib,data}/**/*") + %w(README.md LICENCE)
	s.executables	<<	"pixage"
	s.homepage		=	"https://github/krupani/pixage"
	s.license		=	"MIT"

	s.add_runtime_dependency('mini_magick', '~> 4')
	s.add_runtime_dependency('colorize', '~> 0')

	s.requirements	<< 'You must have ImageMagick installed on your system.'
end