

Pod::Spec.new do |s|


  s.name         = "MFDropboxManager"
  s.version      = "0.1"
  s.summary      = "Easily work with the dropbox sync api. Read and write to a single dropbox file for easy data storage. "

  s.homepage     = "https://github.com/mafellows/MFDropboxManager"

  s.license      = { :type => "MIT", :file => "LICENSE.md" }


  s.author             = { "Michael Fellows" => "michael.fellows12@gmail.com" }

  s.platform     = :ios, '6.0'


  s.source       = { :git => "https://github.com/mafellows/MFDropboxManager.git", :commit => "2b8e091cb6012abf92be043acfd2908fa5482e7f" }


  s.source_files  = 'Classes', '*/MFDropboxManager.{h,m}'
  s.exclude_files = 'Classes/Exclude'



  s.frameworks = 'CFNetwork', 'Security', 'SystemConfiguration', 'QuartzCore', 'Dropbox'

  s.library   = 'c++'

  s.dependency 'Dropbox-Sync-API-SDK'

  s.requires_arc = true
end
