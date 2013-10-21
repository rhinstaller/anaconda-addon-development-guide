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
	rsync -avz tmp/en-US/html-single/ vpodzime@fedorapeople.org:/home/fedora/vpodzime/public_html/anaconda-addon-development-guide/

publish-all: publish pdf
	rsync -avz tmp/en-US/pdf/ vpodzime@fedorapeople.org:/home/fedora/vpodzime/public_html/anaconda-addon-development-guide/pdf/

clean:
	publican clean
