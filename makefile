TARGET      = resume

ENV         = TEXINPUTS=.//:$(TEXINPUTS)
SOURCES     = $(shell find . -name "*.sty" -o -name "*.tex" -o -name "*.cls" -o -name "*.xtx")
IMAGES      = images/*
FONTS       = fonts/*

all: $(TARGET).pdf

$(TARGET).pdf: $(SOURCES) $(FONTS) $(IMAGES) $(TARGET).out
	$(ENV) xelatex $(TARGET).xtx

.PHONY = $(TARGET).out
$(TARGET).out:
	$(ENV) xelatex $(TARGET).xtx

clean:
	rm -rf *.aux *.log *.out *.pdf
