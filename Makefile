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
	pandoc -s -o ./dist/$@ $< --toc --metadata title="The European Digital Identity Wallet Architecture and Reference Framework" --metadata lang="en" --self-contained --css=styles/style.css
	node fix.js
	cd ./dist && cp output.html $@ && rm output.html
	pandoc -o ./dist/$@.docx ./dist/$@ --reference-doc=styles/reference.docx

# Generate docx
arf.docx: arf.md
	pandoc -o ./dist/$@ $<

# Run a local http server
serve:
	npx http-server .

prepare:
	mkdir -p dist
	npm install
	
clean:
	echo $(GENERATED)
	rm -f $(GENERATED) arf.html.docx
	rm -f ./dist -R