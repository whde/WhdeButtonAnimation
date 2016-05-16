Pod::Spec.new do |s|
s.name          = "WhdeButtonAnimation"
s.version       = "1.0.0"
s.summary       = "iOS UIButton with Click Animation like Android's button animation"
s.homepage      = "https://github.com/whde/WhdeButtonAnimation"
s.license       = 'MIT'
s.author        = { "Whde" => "460290973@qq.com" }
s.platform      = :ios, "7.0"
s.source        = { :git => "https://github.com/whde/WhdeButtonAnimation.git", :tag => s.version.to_s }
s.source_files  = 'WhdeButtonAnimation/Class/*'
s.frameworks    = 'Foundation'
s.requires_arc  = true
s.description   = <<-DESC
iOS UIButton with Click Animation like Android 5.0
DESC
end

