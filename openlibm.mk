# config for build openlibm
# export:
#	- CFLAGS_add
#	- LDFLAGS_add
#	- OPENLIBM_LIB

# ---- OpenlibM settings
_OPENLIBM_DIR?=$(abspath libm/openlibm)
include $(_OPENLIBM_DIR)/Make.inc

# Set rpath of tests to builddir for loading shared library
OPENLIBM_LIB = -L$(OPENLIBM_HOME) -lopenlibm
ifneq ($(OS),WINNT)
ifneq ($(OS),Darwin)
OPENLIBM_LIB += -Wl,-rpath=$(OPENLIBM_HOME)
endif
else # WINNT
CFLAGS_add += -DIMPORT_EXPORTS
endif
