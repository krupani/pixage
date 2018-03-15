require 'logger'

module Pixage

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

		private :check_image_magick_installation 

	end

end


