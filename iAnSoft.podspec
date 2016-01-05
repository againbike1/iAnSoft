Pod::Spec.new do |s|

  s.name         = "iAnSoft"
  s.version      = "0.0.1"
  s.summary      = "iAnSoft Develpoe iOS Library."

  s.description  = <<-DESC
                   iAnSoft Develpoe iOS Library.
                   DESC

  s.homepage     = "https://github.com/arthas001/iAnSoft.git"
  # s.screenshots  = "www.example.com/screenshots_1.gif", "www.example.com/screenshots_2.gif"
  s.license      = "MIT"
  s.author             = { "Thomas" => "hanxuepeng001@163.com" }
  s.source       = { :git => "https://github.com/arthas001/iAnSoft.git", :tag => 0.01 }
  s.source_files  = "Classes", "Classes/**/*.{h,m}"
  s.requires_arc = true

  # s.public_header_files = "Classes/**/*.h"
  # s.framework  = "SomeFramework"
  # s.frameworks = "SomeFramework", "AnotherFramework"
  # s.library   = "iconv"
  # s.libraries = "iconv", "xml2"

end
