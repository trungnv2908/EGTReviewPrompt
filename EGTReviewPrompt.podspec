
Pod::Spec.new do |s|

  s.name         = "EGTReviewPrompt"
  s.version      = "1.0"
  s.summary      = "Show prompt view"


  s.homepage     = "https://github.com/trungnv2908/EGTReviewPrompt"
    s.license      = { :type => 'EGT', :file => 'LICENSE' }


  s.author       = { "trung nguyen" => "Trung@EvilGeniusTechnologies.com" }


  s.platform     = :ios, '5.0'



  s.source       = { :git => "https://github.com/trungnv2908/EGTReviewPrompt.gitt", :tag => "1.0" }


  s.source_files  = 'Classes', 'Classes/**/*.{h,m}'


  # s.resource  = "icon.png"
  # s.resources = "Resources/*.png"

  # s.preserve_paths = "FilesToSave", "MoreFilesToSave"


  # ――― Project Linking ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Link your library with frameworks, or libraries. Libraries do not include
  #  the lib prefix of their name.
  #

  # s.framework  = 'SomeFramework'
  # s.frameworks = 'SomeFramework', 'AnotherFramework'

  # s.library   = 'iconv'
  # s.libraries = 'iconv', 'xml2'


  # ――― Project Settings ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  If your library depends on compiler flags you can set them in the xcconfig hash
  #  where they will only apply to your library. If you depend on other Podspecs
  #  you can include multiple dependencies to ensure it works.

  # s.requires_arc = true

  # s.xcconfig = { 'HEADER_SEARCH_PATHS' => '$(SDKROOT)/usr/include/libxml2' }
  # s.dependency 'JSONKit', '~> 1.4'

end
