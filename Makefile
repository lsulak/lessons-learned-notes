install_lyx:
    apt-get install lyx fonts-lyx

make_dest_dir:
	$(info    === Making a directory with the final PDFs if it doesn't exist.)
	[ -d pdfs ] || mkdir pdfs

clear_dest_dir:
	$(info    === Cleaning a directory with the final PDFs.)
	rm -f pdfs/*.pdf

make_pdfs:
	$(info    === Building PDFs.)
	FILES=`find lynx_books -name '[a-z-A-Z_-]*.lyx' -print`; \
	lyx --export pdf4 $${FILES}

copy_pdfs:
	$(info    === Copying PDFs into the final directory.)
	FILES=`find lynx_books -name '[a-z-A-Z_-]*.pdf' -print`; \
	mv $${FILES} pdfs

all: make_dest_dir clear_dest_dir make_pdfs copy_pdfs
