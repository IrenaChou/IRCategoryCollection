Pod::Spec.new do |s|

  s.name         = "IRCategoryCollection"
  s.version      = "1.0.8"
  s.summary      = "IRCategoryCollection category 管理"

  s.description  = <<-DESC
              简单便捷的对category进行管理，方便多个项目的使用，避免多个项目使用的复制粘贴问题
                   DESC

  s.homepage     = "https://github.com/IrenaChou/IRCategoryCollection.git"
  s.license      = "MIT"
  s.author       = { "irenaChou" => "znirena@gmail.com" }
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/IrenaChou/IRCategoryCollection.git", :tag => "#{s.version}" }  
  s.framework  = "UIKit","Foundation"
  s.requires_arc = true


  # 设置子文件夹
  s.subspec 'NSString' do |ss|
    ss.source_files = 'IRCategoryC/NSString/*.{h,m}'
    ss.public_header_files = 'IRCategoryC/NSString/*.h'
  end

  s.subspec 'UIButton' do |ss|
    ss.source_files = 'IRCategoryC/UIButton/*.{h,m}'
    ss.public_header_files = 'IRCategoryC/UIButton/*.h'
  end

  s.subspec 'UIImage' do |ss|
    ss.source_files = 'IRCategoryC/UIImage/*.{h,m}'
    ss.public_header_files = 'IRCategoryC/UIImage/*.h'
  end

  s.subspec 'UIView' do |ss|
    ss.source_files = 'IRCategoryC/UIView/*.{h,m}'
    ss.public_header_files = 'IRCategoryC/UIView/*.h'
  end

  s.subspec 'IRQuicklyCreated' do |ss|
    ss.source_files = 'IRCategoryC/IRQuicklyCreated/*.{h,m}'
    ss.public_header_files = 'IRCategoryC/IRQuicklyCreated/*.h'
  end

  s.subspec 'Other' do |ss|
    ss.source_files = 'IRCategoryC/*.{h,m}'
    ss.public_header_files = 'IRCategoryC/*.h'
  end

end
