Given(/^I am on google "(uae|india)" page$/) do |country|
	case country.downcase
	when "uae"
		@driver.get("https://google.ae")
	when "india"
		@driver.get("https://google.co.in")
	end
end

Given(/^I capture a screenshot named "([^"]*)"$/) do |name|
	@driver.save_screenshot("features/screenshots/#{name}.png")
end

Then(/^I compare "([^"]*)" with "([^"]*)" screenshots to generate diff$/) do |ss1, ss2|
	# Here we check that if we are comparing with a baseline image (previously stored expected image)
	# Then we do not know the size of the saved image, hence its best to use `resize_n_compare` command
	# NOTE: resize_n_compare will only resize keeping the aspect ratio intact, if your aspect ratio is messed up, please fix the aspect ration first


	# When comparing 2 runtime images, we can be sure that both sizes of the images will be same
	# Hence we do not care about resizing and directly use `compare` command

	if ss1.include?("baseline") or ss2.include?("baseline")
		diff_path = resize_n_compare("features/screenshots/#{ss1}.png", "features/screenshots/#{ss2}.png")
	else
		diff_path = compare("features/screenshots/#{ss1}.png", "features/screenshots/#{ss2}.png")
	end
	
	# Encoding the diff image to base64 to embed into cucumber report
	encoded_image = Base64.encode64(File.open(diff_path).read)
	embed_screenshot(encoded_image)
end