-include ../thumb/Makedefs

#------------------------------------------------------------------------------

TARG= edworld
OBJS= demo.o main.o data.o

DEPS= $(OBJS:.o=.d)

#------------------------------------------------------------------------------

CFLAGS += -I../thumb/include

ifeq (,$(STATIC))
	THUMB = -L../thumb/src -lthumb
else
	THUMB = ../thumb/src/libthumb.a
endif

#------------------------------------------------------------------------------

$(TARG) : $(OBJS)
	$(CXX) $(CFLAGS) -o $(TARG) $(OBJS) $(THUMB) $(LIBS)

clean :
	$(RM) $(OBJS) $(DEPS) $(TARG)

#------------------------------------------------------------------------------

DATA= $(shell find data -name \*.md   \
                     -o -name \*.xml  \
                     -o -name \*.ttf  \
                     -o -name \*.obj  \
                     -o -name \*.png  \
                     -o -name \*.vert \
                     -o -name \*.frag)

data.zip : $(DATA)
	(cd data && zip -FS9r ../data.zip $(subst data/,,$(DATA)))

data.cpp : data.zip
	xxd -i data.zip > data.cpp

#------------------------------------------------------------------------------

ifneq ($(MAKECMDGOALS),clean)
-include $(DEPS)
endif
