##
# Variables
##
.EXPORT_ALL_VARIABLES:
.NOTPARALLEL:

GRAPHQL_SCHEMA_DIR				:= $(CURDIR)/SpaceMax/Core/Networking/GraphQL/SpaceX
APOLLO_IOS_CLI					:= ./apollo-ios-cli
APOLLO_CODEGEN_CONFIG_FILE		:= $(GRAPHQL_SCHEMA_DIR)/apollo-codegen-config.json
APOLLO_IOS_CLI_DOWNLOAD_URL 	:= https://github.com/apollographql/apollo-ios/releases/download/1.1.2/apollo-ios-cli.tar.gz
XCCONFIG_PATH					:= $(CURDIR)/SpaceMax/Config.xcconfig
TOMORROW_IO_API_KEY_ID			:= TOMORROW_IO_API_KEY

##
# `help` description
##
define HELP_CONTENT
\033[1msetup\033[0m
    Setup required tools, settings and files to build this app.
\033[1minstall-tools\033[0m
    Install needed packages and tools.
\033[1minit-graphql-codegen-config\033[0m
    Initialize the GraphQL CLI code generator config. \033[1mNote\033[0m: it may have been already initalized.
\033[1mfetch-graphql-schema\033[0m
    Downloads the GraphQL `schema.graphqls` file to ($(GRAPHQL_SCHEMA_DIR)).
\033[1mgenerate-graphql-code\033[0m
    Generate the Swift objects, schemas and operations based on `.graphql` files existent on ($(GRAPHQL_SCHEMA_DIR)).
\033[1mset-tomorrow-io-api-key\033[0m
    Sets the tomorrow.io API key to xcconfig file, to be used inside the project.
endef

##
# `help` command
##
.PHONY: help
help:
	@echo "$$HELP_CONTENT"

##
# `setup` command
##
.PHONY: setup
setup: 
	$(MAKE) install-tools
	$(MAKE) init-graphql-codegen-config
	$(MAKE) fetch-graphql-schema
	$(MAKE) generate-graphql-code
	$(MAKE) set-tomorrow-io-api-key

##
# `install-tools` command
##
.PHONY: install-tools
install-tools:
# Could also check `yarn` or any other Node package manager,
# but will check only `npm` to keep it simple
ifeq (, $(shell which npm))
	$(error npm needs to be installed (https://docs.npmjs.com/downloading-and-installing-node-js-and-npm#using-a-node-version-manager-to-install-nodejs-and-npm))
endif
# Install packages
	npm install -D apollo
	npm install -D graphql
# Install Apollo command-line. There is an issue with Xcode 14.3
# https://github.com/apollographql/apollo-ios/issues/2919#issuecomment-1492481609
	curl -LO $(APOLLO_IOS_CLI_DOWNLOAD_URL)
	tar -xzvf apollo-ios-cli.tar.gz
	rm -rf apollo-ios-cli.tar.gz 
	@echo "Apollo GraphQL command-line link created at $(CURDIR)/apollo-ios-cli"

##
# `init-graphql-codegen-config` command
##
.PHONY: init-graphql-codegen-config
init-graphql-codegen-config:
ifeq (, $(wildcard $(APOLLO_CODEGEN_CONFIG_FILE)))
	$(APOLLO_IOS_CLI) init \
		--schema-namespace SpaceMax \
		--module-type=embeddedInTarget \
		--target-name=SpaceMax \
		--path=$(APOLLO_CODEGEN_CONFIG_FILE)
else
	$(info apollo-codegen-config.json exists at $(APOLLO_CODEGEN_CONFIG_FILE). Skipping...)
endif

##
# `fetch-graphql-schema` command
##
.PHONY: fetch-graphql-schema
fetch-graphql-schema:
	$(APOLLO_IOS_CLI) fetch-schema \
		--path=$(APOLLO_CODEGEN_CONFIG_FILE) \
		--verbose

##
# `generate-graphql-code` command
##
.PHONY: generate-graphql-code
generate-graphql-code:
	$(APOLLO_IOS_CLI) generate \
		--path=$(APOLLO_CODEGEN_CONFIG_FILE) \
		--verbose

.PHONY: set-tomorrow-io-api-key
set-tomorrow-io-api-key:
ifeq (, $(wildcard $(XCCONFIG_PATH)))
	@read -p "Enter tomorrow.io API key: " api_key; \
    echo "$$TOMORROW_IO_API_KEY_ID = $$api_key" > $(XCCONFIG_PATH); \
	echo "$$TOMORROW_IO_API_KEY_ID set in $$XCCONFIG_PATH"
else
	$(info File $(XCCONFIG_PATH) already exists. Please, update the value for $(TOMORROW_IO_API_KEY_ID) key directly there)
endif
