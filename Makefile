ALL_FORMATS = pdf,html-single
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

html-single: ${SOURCES}
	publican build --langs=en-US --formats=html-single

publish: html-single
	scp -r tmp/en-US/html-single/* xpodzim@aisa.fi.muni.cz:/home/xpodzim/public_html/anaconda-addon-development-guide/

clean:
	publican clean
