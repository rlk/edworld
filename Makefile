# EdWorld -- Linux / OS X Makefile

THUMB_DIR = ../thumb

include $(THUMB_DIR)/Makedefs

APPLIBS = -L$(THUMB_DIR)/$(CONFIG) -lthumb
CFLAGS += -I$(THUMB_DIR)/include

B2C = $(THUMB_DIR)/etc/bin2c

THUMB = $(THUMB_DIR)/$(CONFIG)/libthumb.a

#------------------------------------------------------------------------------

OBJS= demo.o main.o data.o
DEPS= $(OBJS:.o=.d)
TARG= edworld

#------------------------------------------------------------------------------

$(CONFIG)/$(TARG) : $(CONFIG) $(OBJS) $(THUMB)
	$(CXX) $(CFLAGS) -o $@ $(OBJS) $(THUMB) $(LIBS)

$(CONFIG) :
	mkdir -p $(CONFIG)

clean :
	$(RM) $(OBJS) $(DEPS) $(TARG) data/data.zip

#------------------------------------------------------------------------------

data.cpp : data/data.zip
	$(B2C) edworld_data < $< > $@

data/data.zip :
	$(MAKE) -C data

#------------------------------------------------------------------------------

ifneq ($(MAKECMDGOALS),clean)
-include $(DEPS)
endif
