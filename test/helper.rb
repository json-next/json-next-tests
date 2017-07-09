# encoding: utf-8


require 'logutils'
require 'textutils'

# note: for now use "packaged" version in gem
#  (not the source in ../json-next/lib)
require 'json/next'




require 'minitest/autorun'


LogUtils::Logger.root.level = :debug



def walk(root, &block)
  Dir.foreach(root) do |name|
    ## puts "name: #{name}"
    path = File.join(root, name)

    if name == '.' || name == '..'
      next
    elsif File.directory?( path )

      ## note: skip .git !!
      ##        test folder with ruby test scripts
      next if ['.git', 'test'].include?( name )

      puts "** directory: #{path}/"
      walk( path, &block )
    else
      puts "  #{name}"
      block.call( path )   ## same as yield( path )
    end
  end
end
