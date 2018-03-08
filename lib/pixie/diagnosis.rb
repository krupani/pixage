require 'logger'

module Pixie

	class Diagnosis

		def perform_diagnosis
  			check_image_magick_installation
  			# check_idevice_installation
  			# check_adb_installation
		end

		def check_image_magick_installation
			puts "Checking ImageMagick installation.."
			version = `magick -version | grep -i version`
			if version.class == String and version.include?("ImageMagick")
				console_log("ImageMagick is INSTALLED", :pass)
			else
				console_log("ImageMagick is NOT INSTALLED", :error)
			end
		end

		# def check_adb_installation
		# 	puts "Checking adb installation for Android devices.."
		# 	version = `adb version | grep -i version`
		# 	if version.class == String and version.include?("Android Debug Bridge")
		# 		puts ":) :) :) -- abd Found -- :) :) :)"
		# 	else
		# 		puts ":( :( :( -- abd NOT FOUND -- :( :( :("
		# 	end
		# end

		# def check_idevice_installation
		# 	puts "Checking idevice installation for iOS devices.."
		# end

		private :check_image_magick_installation #, :check_adb_installation, :check_idevice_installation

	end

end


