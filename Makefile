SWIG=swig 
SWIG_DIR=/SWIG
INTERFACE_FILE=quantlib.i
WRAP_FLAGS=-flat_namespace -undefined suppress
LIB_FLAG=-shared

# QuantLib library dirs
LIBQL_DIR=/usr/local
LIBQL_INCDIR=$(LIBQL_DIR)/include
LIBQL_LIBDIR=$(LIBQL_DIR)/lib

# Luajit install dirs
LUA_DIR=/usr/local
LUA_LIBDIR=$(LUA_DIR)/lib/lua/5.1
LUA_SHAREDIR=$(LUA_DIR)/share/lua/5.1

quantlib_wrap.cpp :
	$(SWIG) -lua -c++ -o quantlib_wrap.cpp $(SWIG_DIR)/$(INTERFACE_FILE)

quantlib_wrap.o : quantlib_wrap.cpp
	$(CXX) $(WRAP_FLAGS) -c quantlib_wrap.cpp -o quantlib_wrap.o -lQuantLib -L$(LIBQL_LIBDIR) -I$(LIBQL_INCDIR)

quantlib.so : quantlib_wrap.o quantlib_wrap.cpp
	$(CXX) $(LIB_FLAG) $(WRAP_FLAGS) quantlib_wrap.o -o quantlib.so -lQuantLib -L$(LIBQL_LIBDIR) -I$(LIBQL_INCDIR)
	
install : quantlib.so quantlib_wrap.o quantlib_wrap.cpp
	cp quantlib.so $(LUA_LIBDIR)
		
clean : 
	rm quantlib_wrap.cpp quantlib_wrap.o quantlib.so

