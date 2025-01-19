XCODE_USER_TEMPLATES_DIR := $(HOME)/Library/Developer/Xcode/Templates/File\ Templates
TEMPLATES_DIR := Clean\ Swift
TEMPLATE_PATH := $(XCODE_USER_TEMPLATES_DIR)/$(TEMPLATES_DIR)

install:
	mkdir -p "$(XCODE_USER_TEMPLATES_DIR)" && \
	rm -rf "$(TEMPLATE_PATH)" && \
	rsync -a "$(TEMPLATES_DIR)/" "$(TEMPLATE_PATH)/"

uninstall:
	rm -rf "$(TEMPLATE_PATH)"
