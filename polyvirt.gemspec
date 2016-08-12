# Ensure we require the local version and not one we might have installed already
require File.join([File.dirname(__FILE__),'lib','polyvirt','version.rb'])
spec = Gem::Specification.new do |s|
  s.name = 'polyvirt'
  s.version = Polyvirt::VERSION
  s.author = 'Steve Barber'
  s.email = 'steve.barber@nist.gov'
  #s.homepage = 'http://your.website.com'
  s.platform = Gem::Platform::RUBY
  s.summary = 'A high-level manager for libvirt hypervisors and guests'
  s.files = `git ls-files`.split("
")
  s.require_paths << 'lib'
  s.has_rdoc = true
  s.extra_rdoc_files = ['README.rdoc','polyvirt.rdoc']
  s.rdoc_options << '--title' << 'polyvirt' << '--main' << 'README.rdoc' << '-ri'
  s.bindir = 'bin'
  s.executables << 'polyvirt'
  s.add_development_dependency('rake')
  s.add_development_dependency('rdoc')
  s.add_development_dependency('aruba')
  s.add_runtime_dependency('gli')
  s.add_runtime_dependency('ruby-libvirt')
end
