# Makefile for Sovereign Grok Agent Suite
# Useful commands for development and PDF generation

.PHONY: help pdf clean

help:
	@echo "Available commands:"
	@echo "  make pdf        - Generate a combined PDF of the suite"
	@echo "  make clean      - Remove generated PDFs"

# Generate combined PDF using Pandoc
pdf:
	@echo "Generating Sovereign Grok Agent Suite PDF..."
	pandoc docs/*.md -o Sovereign_Grok_Agent_Suite_v1.0.0.pdf \
		--toc --toc-depth=3 \
		--pdf-engine=xelatex \
		-V geometry:margin=1in \
		-V fontsize=11pt \
		--highlight-style=tango
	@echo "PDF created: Sovereign_Grok_Agent_Suite_v1.0.0.pdf"

clean:
	rm -f *.pdf
	@echo "Cleaned up generated PDFs."