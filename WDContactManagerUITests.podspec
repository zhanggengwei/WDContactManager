Pod::Spec.new do |s|
 s.name     = 'WDContactManager'
 s.version  = '1.0'
 s.license  = 'MIT'
 s.summary  = 'An atuo fit size tagView on iOS.'
 s.homepage = 'https://github.com/jiangzhengwei120/WDContactManager'
 s.authors  = { 'WD' => 'm18363070380@163.com' }
 s.source   = { :git => 'https://github.com/jiangzhengwei120/WDContactManager.git', :tag => s.version }
 s.requires_arc = true
 s.ios.deployment_target = '8.0'
 s.source_files = 'contact/*.{h,m}'
 end




