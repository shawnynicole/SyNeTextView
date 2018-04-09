#
# Be sure to run `pod lib lint SyNeTextView.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
s.name             = 'SyNeTextView'
s.version          = '0.1.1'
s.summary          = 'SyNeTextView: A UITextView with UITextView and UITextField behaviors.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

s.description      = <<-DESC

SyNeTextView can be configured to end editing when a return/enter and/or tab is pressed;
Simply change SyNeTextView.editingMode for the different configurations.

DESC

s.homepage         = 'https://github.com/shawnynicole/SyNeTextView'
# s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
s.license          = { :type => 'MIT', :file => 'LICENSE' }
s.author           = { 'shawnynicole' => '21274059+shawnynicole@users.noreply.github.com' }
s.source           = { :git => 'https://github.com/shawnynicole/SyNeTextView.git', :tag => "Release/#{s.version}" }
# s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

s.ios.deployment_target = '9.0'

s.source_files = 'SyNeTextView/**/*.{h,m,swift}'
s.resources = 'SyNeTextView/**/*.xcassets'
# s.resource_bundles = { 'SyNeTextView' => ['SyNeTextView/**/*.png'] }

# s.public_header_files = 'Pod/Classes/**/*.h'
# s.frameworks = 'UIKit', 'MapKit'

s.dependency 'SyNeNextResponder'

end
