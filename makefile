TARGET      = resume

SOURCES     = $(shell find . -name "*.sty" -o -name "*.tex" -o -name "*.cls" -o -name "*.xtx")
FONTS       = fonts/*

all: $(TARGET).pdf

$(TARGET).pdf: $(SOURCES) $(FONTS)
	xelatex $(TARGET).xtx

clean:
	rm -rf *.aux *.log *.out *.pdf
