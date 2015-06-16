ALL_FORMATS = pdf,html,html-single
SOURCES = en-US/Anaconda_Addon_Development_Guide.ent \
		  en-US/Anaconda_Addon_Development_Guide.xml \
		  en-US/Article_Info.xml \
		  en-US/Author_Group.xml \
		  en-US/Revision_History.xml \
		  en-US/images/icon.svg

all: ${SOURCES}
	publican build --langs=en-US --formats=${ALL_FORMATS}

pdf: ${SOURCES}
	publican build --langs=en-US --formats=pdf

html: ${SOURCES}
	publican build --langs=en-US --formats=html

html-single: ${SOURCES}
	publican build --langs=en-US --formats=html-single

publish: html
	@echo "Now push the html contents to the gh-pages branch manually:"
	@echo "  rm -rf ../aadg_html"
	@echo "  cp -r tmp/en-US/html/ ../aadg_html"
	@echo "  git checkout gh-pages"
	@echo "  cp -r ../aadg_html/* ."
	@echo "  git add -u && git commit"
	@echo "  git push origin gh-pages"
	@echo "  git checkout master"
	@echo "  rm -rf ../aadg_html"

clean:
	publican clean

.PHONY: all pdf html html-single publish clean
