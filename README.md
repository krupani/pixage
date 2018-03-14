# pixie

An image comparison utility which can be used manually or be integrated with an existing selenium-ruby or appium-ruby automation framework to perform __*visual regression testing*__ of screenshots.


## Table of contents
- [Installation](#installation)  
    - [Install using gem command](#gem)    
    - [Install using bundler](#bundler)
- [Dependency](#dependency)
- [Usage](#usage)
    - [CLI Usage](#cli)
    - [Automation Usage](#automation)
- [Contributing](#contributing)   
- [Issues](#issues)     
    

## Installation  
There are multiple ways in which you can install and use pixie gem.
You must have Ruby installed before you can install this gem.   

### <a name="gem" /> 1. Install using gem command 
Just use following command from you Terminal.   
``` 
gem install pixie 
```
   
### <a name="bundler" /> 2. Install using bundler    
You can include it in your Gemfile and run bundle install.     
``` 
gem 'pixie' 
```   
then run following   
```   
bundle install   
```  

## Dependency   
This gem is dependent on ImageMagick. Please install latest verison of ImageMagick before you start using pixie.   
To verify if imagemagick is successfully installed, please run the following command (After installaing pixie).   
```   
pixie diagnosis 
```    
   
## Usage   
There are 2 ways this gem can be used. 
1. CLI usage which can be really helpful for testers and designers to do visual regression testing manually.
2. Can be integrated with automation suite to compare run time screenshots with pre-saved baseline images.  

### <a name="cli"></a> 1. CLI Usage
Following are the list of commands :  
    
![help, diagnosis, compare, resize_n_compare, version](https://github.com/krupani/pixie/blob/master/images/pixie_commands.png)    

Basic usage in case of compare 2 images which are similar size and resolution:   
```   
# Basic usage with default options    
pixie compare images/expected.png images/actual.png    

# Basic usage with custom options
pixie compare images/expected.png images/actual.png --threshold=1 --fuzz=25 --color=red

```   
    
For further commmand usage [documentation](https://github.com/krupani/pixie/wiki), please refer the [wiki](https://github.com/krupani/pixie/wiki) section.    

### <a name="automation"></a> 2. Automation Usage    
Apart from CLI usage, pixie gem can also be integrated with automation suite be it a selenium-webdriver-ruby for web application or appium-ruby for mobile applications or just a ruby script acheieving some fine purpose.     
Below is the code snippet to be used in case of automation integration:

```
# First, as mentioned in installation step, include gem in Gemfile
gem 'pixie'        
    
# Next, require and include it in your project
require 'pixie'    
include 'Pixie'     

# Finally use the commands in your code:    
# Assuming you have your baseline/expected image previously stored
@driver.save_screenshot(actual.png)
resize_n_compare(expected.png, actual.png)

# Also you can compare 2 runtime images like:
@driver.save_screenshot(first.png)
@driver.save_screenshot(second.png)
compare(first.png, second.png)

```

_NOTE: To see a working example on how to integrate pixie with a Ruby-Cucumber-Selenium tests, please see the examples directory. It also has a sample report stored for reference._

## Contributing   
Ideas and suggestions are always always most welcome. Please fork this gem and feel free to add any updates, suggestions etc and create a pull request.  

## Issues
If you face any problem related to syntax, usability, documentation then please raise an [issue](https://github.com/krupani/pixie/issues)    
