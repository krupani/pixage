Before do
	@driver = TestNow.init	
end

After do 
	@driver.quit
end

def embed_screenshot(encoded_image)
	embed("#{encoded_image}", "image/png;base64")
end