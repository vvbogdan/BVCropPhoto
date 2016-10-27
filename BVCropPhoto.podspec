Pod::Spec.new do |s|

  s.name         = "BVCropPhoto"
  s.version      = "1.0.0"
  s.summary      = "Image cropping library for iOS."
  s.homepage     = "https://github.com/vvbogdan/BVCropPhoto"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "Vitalii Bogdan" => "bogdan.vitalik@gmail.com" }
  s.platform     = :ios, "9.0"
  s.source       = { :git => "https://github.com/vvbogdan/BVCropPhoto.git", :tag => "1.0.0" }
  s.source_files  = "BVCropPhoto", "BVCropPhoto/**/*.{h,m}"
  s.requires_arc = true
end
