-include ../thumb/Makedefs

#------------------------------------------------------------------------------

TARG= edworld
OBJS= demo.o main.o

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

ifneq ($(MAKECMDGOALS),clean)
-include $(DEPS)
endif
