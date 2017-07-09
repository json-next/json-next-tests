# encoding: utf-8

###
#  to run use
#     ruby -I ./test test/test_json.rb
#  or better
#     rake test

require  'helper'


class TestJson < MiniTest::Test

  def test_all
     walk_tests( '.' )

     ## read_tests( './hanson/*' )
     ## read_tests( './son/sample*' )
  end  # method test_all



private

def walk_tests( root='.' )
    walk( root ) do |path|

       ## note: skip README, Rakefile etc.
       ##    check for extensions
       extname = File.extname( path )    # note: includes dot e.g. .json etc.
       next unless ['.txt'].include?( extname )

       read_test( path )
    end
end # walk_feeds


def read_tests( pattern )
  files = Dir.glob( pattern )
  files.each do |path|
      puts "  #{path}"
      read_test( path )
  end
end


def read_test( path )
       puts "  reading #{path} ..."

       ## todo/fix:
       ## change to BlockFile.read_utf8( path )

       b = BlockReader.from_file( path ).read

       ## puts "  [debug] block.size: #{b.size}"
       json_next_text  = b[0]   ## block I: json next source text (hanson, son, etc.)
       json_yeold_text = b[1]   ## block II: "vanilla" ye old' json

       if json_yeold_text.nil?
         puts "!!!! ye old' json test assert missing in #{path} !!!"
         exit 1
       else
         ##
         ## puts "*** assert #{path}"
         if path =~ %r{/hanson/}
           assert_equal JSON.parse( json_yeold_text ), HANSON.parse( json_next_text )
         elsif path =~ %r{/son/}
           assert_equal JSON.parse( json_yeold_text ), SON.parse( json_next_text )
         elsif path =~ %r{/jsonx/}
           assert_equal JSON.parse( json_yeold_text ), JSONX.parse( json_next_text )
         else
           puts "!!!! unknown json next format in #{path} !!!"
           exit 1
         end
       end
end

end # class TestJson
