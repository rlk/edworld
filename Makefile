-include ../thumb/Makedefs

#------------------------------------------------------------------------------

TARG= edworld
OBJS= demo.o main.o

DEPS= $(OBJS:.o=.d)

#------------------------------------------------------------------------------

ifneq (,$(STATIC))
	CFLAGS += -I../thumb/include
	LIBS   +=   ../thumb/src/libthumb.a
else
	CFLAGS += -I../thumb/include
	LIBS   += -L../thumb/src -lthumb
endif

#------------------------------------------------------------------------------

$(TARG) : $(OBJS) $(THUMB)
	$(CXX) $(CFLAGS) -o $(TARG) $(OBJS) $(LIBS)

clean :
	$(RM) $(OBJS) $(DEPS) $(TARG)

#------------------------------------------------------------------------------

ifneq ($(MAKECMDGOALS),clean)
-include $(DEPS)
endif
