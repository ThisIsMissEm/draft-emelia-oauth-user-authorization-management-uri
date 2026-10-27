export UPLOAD_EMAIL ?= emelia@brandedcode.com

LIBDIR := lib
include $(LIBDIR)/main.mk

# Use xml2rfc's built-in (rfc-editor.org) stylesheet instead of the template's serif one
XML2RFC_HTML := --html --metadata-js-url=/dev/null

$(LIBDIR)/main.mk:
ifneq (,$(shell grep "path *= *$(LIBDIR)" .gitmodules 2>/dev/null))
	git submodule sync
	git submodule update --init
else
ifneq (,$(wildcard $(ID_TEMPLATE_HOME)))
	ln -s "$(ID_TEMPLATE_HOME)" $(LIBDIR)
else
	git clone -q --depth 10 -b main \
	    https://github.com/martinthomson/i-d-template $(LIBDIR)
endif
endif

serve:
	python -m http.server -b 127.0.0.1 4000