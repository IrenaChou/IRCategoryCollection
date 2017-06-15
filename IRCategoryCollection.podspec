Pod::Spec.new do |s|

  s.name         = "IRCategoryCollection"
  s.version      = "1.0.3"
  s.summary      = "IRCategoryCollection category 管理"

  s.description  = <<-DESC
              简单便捷的对category进行管理，方便多个项目的使用，避免多个项目使用的复制粘贴问题
                   DESC

  s.homepage     = "https://github.com/IrenaChou/IRCategoryCollection.git"
  s.license      = "MIT"
  s.author       = { "irenaChou" => "znirena@gmail.com" }

  s.platform     = :ios, "8.0"

  s.source       = { :git => "https://github.com/IrenaChou/IRCategoryCollection.git", :tag => "#{s.version}" }


  # s.source_files = "IRCategoryCollection/classes/**/*.{h,m}"
  s.source_files = "IRCategoryC"
  
  s.framework  = "UIKit","Foundation"
  s.requires_arc = true

end
