-include ../thumb/Makedefs

#------------------------------------------------------------------------------

TARG= edworld
OBJS=   demo.o \
	main.o

DEPS= $(OBJS:.o=.d)

#------------------------------------------------------------------------------

CFLAGS += -I../thumb/include
LIBS   += -L../thumb/src -lthumb

#------------------------------------------------------------------------------

$(TARG) : $(OBJS) $(THUMB)
	$(CXX) $(CFLAGS) -o $(TARG) $(OBJS) $(LIBS)

clean :
	$(RM) $(OBJS) $(DEPS) $(TARG)

#------------------------------------------------------------------------------

ifneq ($(MAKECMDGOALS),clean)
-include $(DEPS)
endif
