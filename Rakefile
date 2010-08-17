# -*- ruby -*-

require 'rubygems'
require 'hoe'

Hoe.spec 'wolex' do
  developer('Aaron Patterson', 'aaron@tenderlovemaking.com')
  self.readme_file   = 'README.rdoc'
  self.history_file  = 'CHANGELOG.rdoc'
  self.extra_rdoc_files  = FileList['*.rdoc']
  self.testlib = :minitest

  self.extra_dev_deps << ["minitest", ">= 1.6.0"]
  self.extra_dev_deps << ["rexical", ">= 1.0.5.beta1"]
end

rule '.rb' => '.rex' do |t|
  sh "rex --independent -o #{t.name} #{t.source}"
end

Rake::Task[:test].prerequisites << "lib/wolex/scanner.rb"

# vim: syntax=ruby
