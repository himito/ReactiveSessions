# ReactiveML compiler
RMLBUILD := rmlbuild -classic-display

# Flags, Libraries and Includes
FLAGS := -Is lib \
		 -tag annot

# Target of the compilation
TARGET := native

# The directory for binaries
TARGETDIR := bin

# Default make
all: build directories

# Make a directory and copy the binaries from the _build folder to it
directories:
	@mkdir -p $(TARGETDIR)
	@cp _build/examples/*.rml.$(TARGET) $(TARGETDIR)
	@$(RM) *.rml.$(TARGET)

# Compile
build:
	$(RMLBUILD) $(FLAGS) examples/mathServer.rml.$(TARGET)
	$(RMLBUILD) $(FLAGS) examples/mathServerCPS.rml.$(TARGET)
	$(RMLBUILD) $(FLAGS) examples/test.rml.$(TARGET)

# Clean only objects
clean:
	$(RMLBUILD) -clean

# Clean objects and binaries
cleanall: clean
	@$(RM) -rf $(TARGETDIR)

# Non-file targets
.PHONY: all clean cleanall
