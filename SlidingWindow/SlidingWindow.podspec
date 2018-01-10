

Pod::Spec.new do |s|


s.name                  =  "SlidingWindow"
s.version               = "1.0.0"
s.summary               = "This framework is used to show custom sliding window."
s.description           = "This framework is used to show custom sliding window with animation from bottom to top such as in Youtube app."
s.homepage              = "https://github.com/sawanmind/SlidingWindow"
s.license               = "MIT"
s.author                = { "Sawan Kumar" => "sawanmind@gmail.com" }
s.social_media_url      = "http://twitter.com/sawanmind"
s.platform              = :ios, "11.0"
s.source                = { :git => "https://github.com/sawanmind/SlidingWindow.git", :tag => "#{s.version}" }
s.source_files          = "SlidingWindow/**/*"
s.frameworks            = "UIKit", "Foundation"

end
