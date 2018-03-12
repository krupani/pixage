# pixie

An image comparison utility which can be used manually or be integrated with an existing selenium-ruby or appium-ruby automation framework to perform __*visual regression testing*__ of screenshots.


## Table of contents
- [Installation](#installation)  
    - [Install using gem command](#gem)    
    - [Install using bundler](#bundler)  
- [Usage](#usage)
    - [CLI Usage](#cli)
    - [Automation Usage](#automation)
    

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
  
## Usage   
There are 2 ways this gem can be used. 
1. CLI usage which can be really helpful for testers and designers to do visual regression testing manually.
2. Can be integrated with automation suite to compare run time screenshots with pre-saved baseline images.  

### <a name="cli"></a> 1. CLI Usage
Following are the list of commands :  
    
![help, diagnosis, compare, resize_n_compare, version](https://github.com/krupani/pixie/blob/0.1/images/pixie_commands.png)    

Basic usage in case of compare 2 images which are similar size and resolution:   
```   
# Basic usage with default options    
pixie compare images/expected.png images/actual.png    

# Basic usage with custom options
pixie compare images/expected.png images/actual.png --threshold=1 --fuzz=25 --color=red

```   
    
For further commmand usage [documentation](https://github.com/krupani/pixie/wiki), please refer the [wiki](https://github.com/krupani/pixie/wiki) section.    

### <a name="automation"></a> 2. Automation Usage    
