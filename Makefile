# Prerequisites
# pandoc 
# 
# sudo apt install pandoc
#
# Parameters and Variables
# https://www.gnu.org/software/make/manual/html_node/Automatic-Variables.html#Automatic-Variables
GENERATED=	arf.html \
			arf.docx

all: $(GENERATED)

# Gerenate html, doc from the html
arf.html: arf.md
	pandoc -s -o $@ $< --metadata title="The European Digital Identity Wallet Architecture and Reference Framework"
	pandoc -o $@.docx $@

# Generate docx
arf.docx: arf.md
	pandoc -o $@ $<

clean:
	echo $(GENERATED)
	rm -f $(GENERATED) arf.html.docx