require 'mkmf'

LIBS_DIRS = [
  RbConfig::CONFIG['libdir'],
  File.expand_path(File.join(File.dirname(__FILE__), "bin")),
]
HEADER_DIRS = [
  RbConfig::CONFIG['includedir'],
  File.expand_path(File.join(File.dirname(__FILE__), "include/node/public")),
]

[
  'cares',
  'chrome_zlib',
  'http_parser',
  'jx',
  'openssl',
  'sqlite3',
  'uv',
  'v8_base',
  'v8_nosnapshot',
].map{|lib| "-l#{lib} "}
 .inject($LOCAL_LIBS, :<<)

dir_config('robe', HEADER_DIRS, LIBS_DIRS)
#CONFIG['LDSHARED'] = "$(CXX) -shared"
case RUBY_PLATFORM
when /darwin/
  #CONFIG['LDSHARED'] = CONFIG['LDSHARED'].split[1..-1].join(' ')
  #CONFIG['LDSHARED'] = "$(CXX) -lstdc++ -fPIC -bundle"# << CONFIG['LDSHARED']
  #CONFIG['LDSHARED'] = "g++ -lstdc++"
  #CONFIG['LDSHARED'] << " -lstdc++"
  #CONFIG['CC'] = "clang++"
  #CONFIG['LDSHARED'] = "$(CXX) -lib=stdc++ -v" + CONFIG['LDSHARED'].split[1..-1].join(' ')
  CONFIG['LDSHAREDXX'] << " -v -stdlib=libstdc++ -framework CoreFoundation -framework CoreServices"
  CONFIG['LDSHAREDXX'].gsub!('-undefined suppress', '')
  CONFIG['LDSHAREDXX'].gsub!('-flat_namespace', '')
else
  #CONFIG['LDSHARED'] = "$(CXX) -shared"
end
 
puts '#'*80
puts CONFIG['LDSHARED']
puts CONFIG['LDSHAREDXX']
puts '#'*80

have_library('stdc++') || fail

create_makefile 'robe'
