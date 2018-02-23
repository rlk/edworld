# EdWorld -- Linux / OS X Makefile

THUMB_DIR = ../thumb

-include $(THUMB_DIR)/Makedefs

APPLIBS = -L$(THUMB_DIR)/$(CONFIG) -lthumb
CFLAGS += -I$(THUMB_DIR)/include

B2C = $(THUMB_DIR)/etc/bin2c

#------------------------------------------------------------------------------

# If static Thumb library changes, then edworld must be rebuilt.

ifndef DYNAMIC
	THUMB = $(THUMB_DIR)/$(CONFIG)/libthumb.a
endif

#------------------------------------------------------------------------------

OBJS= demo.o main.o data.o
DEPS= $(filter-out data.d, $(OBJS:.o=.d))
TARG= edworld

#------------------------------------------------------------------------------

$(CONFIG)/$(TARG) : $(CONFIG) $(OBJS) $(THUMB)
	$(CXX) $(CFLAGS) -o $@ $(OBJS) $(APPLIBS) $(LIBS)

$(CONFIG) :
	mkdir -p $(CONFIG)

clean :
	$(RM) $(OBJS) $(DEPS) $(TARG) data/data.zip

#------------------------------------------------------------------------------

data.cpp : data/data.zip
	$(B2C) edworld_data < $< > $@

data/data.zip :
	$(MAKE) -C data

.PHONY : data/data.zip

#------------------------------------------------------------------------------

ifneq ($(MAKECMDGOALS),clean)
-include $(DEPS)
endif
