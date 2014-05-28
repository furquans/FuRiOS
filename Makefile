
COMPILER_PREFIX = arm-linux-gnueabi-

CC = $(COMPILER_PREFIX)gcc
LD = $(COMPILER_PREFIX)ld

CFLAGS = -ansi -pedantic -Wall -Wextra -march=armv7-a -msoft-float -fPIC -mapcs-frame
LDFLAGS = -N -Ttext=0x10000

BUILDDIR = build
SRCDIR = src

KERNELIMAGE = $(BUILDDIR)/kernel.elf
OBJFILES = $(BUILDDIR)/kernel.o $(BUILDDIR)/startup.o 

.SILENT:

$(BUILDDIR)/%.o: $(SRCDIR)/%.c
	@(echo "CC        $^")
	$(CC) $(CFLAGS) -o $@ -c $^

$(BUILDDIR)/%.o: $(SRCDIR)/%.S
	@(echo "CC        $^")
	$(CC) $(CFLAGS) -o $@ -c $^

$(KERNELIMAGE): $(OBJFILES)
	@(echo "GEN       $@")
	$(LD) $(LDFLAGS) -o $@ $^

$(BUILDDIR):
	mkdir -p $@

all: $(BUILDDIR) $(KERNELIMAGE)
	@(echo "Generated kernel image successfully")

.PHONY: clean

clean:
	rm -rf $(BUILDDIR)
	@(echo "Done cleaning")
