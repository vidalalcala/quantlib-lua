package = "QuantLib"
version = "1.0-1"

source = {
   url = "https://github.com/vidalalcala/quantlib-lua"
   tag = "v1.0"
}

description = {
   summary = "QuanLib wrapped with SWIG.",
   detailed = [[
      The C++ wrappers for the QuantLib-Lua extension module are created
by means of SWIG (Simplified Wrapper and Interface Generator) available
from <http://swig.sourceforge.net/>.
   ]],
   homepage = "http://vidalalcala.appspot.com",
   license = "MIT/X11"
}

supported_platforms = {
	"macosx"
}

dependencies = {
   "lua ~> 5.1"
   -- If you depend on other rocks, add them here
}

build = {
   type = "make"
   }