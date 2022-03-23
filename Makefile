.PHONY: help
help: ## Show this usage
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.PHONY: xcode
xcode: ## Select latest version of Xcode
	sudo xcode-select --switch /Applications/Xcode.app/

.PHONY: bootstrap
bootstrap: ## Install tools
	make clean
	make build-cli-tools
	make format-configuration
	bundle config set path 'vendor/bundle'
	bundle install
	bundle binstubs cocoapods --path=vendor/bin

.PHONY: template-flux-%
template-flux-%: ## Generate swift flux files from template. Use specific module name.
	bundle exec generamba gen ${@:template-flux-%=%} flux
	make xcodegen

.PHONY: project
project: ## Generate project
	make swiftgen
	make xcodegen
	bundle exec pod install

.PHONY: xcodegen
xcodegen: ## Generate Xcode project and workspace
	swift run -c release --package-path ./Tools/Common xcodegen

.PHONY: swiftgen
swiftgen: ## Generate resources swift files.
	swift run -c release --package-path ./Tools/Common swiftgen

.PHONY: open
open: ## Open Xcode workspace
	open ./Tony.xcworkspace

.PHONY: clean
clean: ## Clean generated files
	rm -rf ./**/Generated/*
	rm -rf ~/Library/Developer/Xcode/DerivedData/*
	rm -rf Pods
	rm -rf Carthage
	rm -rf ./Tools/**/.build/*

.PHONY: format-configuration
format-configuration: ## Create default .swift-format file if not exists.
    ifneq ("$(wildcard .swift-format)","")
		echo Exists .swift-format;
    else
		swift run -c release --package-path ./Tools/Common swift-format --mode dump-configuration > .swift-format;
    endif

.PHONY: lint
lint: ## Linting Swift code
	swift run -c release --package-path ./Tools/Common swift-format -r ./App -m lint

.PHONY: format
format: ## Reformatting Swift code
	swift run -c release --package-path ./Tools/Common swift-format -r ./App -i

.PHONY: gen-feature
gen-feature: ## Generate Swift code for feature module
	chmod +x Scripts/genesis-feature.sh
	Scripts/genesis-feature.sh

.PHONY: gen-sandbox
gen-sandbox: ## Generate sandbox app
	chmod +x Scripts/genesis-sandbox.sh
	Scripts/genesis-sandbox.sh

.PHONY: build-cli-tools
build-cli-tools: ## Build CLI tools managed by SwiftPM
	swift build -c release --package-path ./Tools/Common --product license-plist
	swift build -c release --package-path ./Tools/Common --product swiftgen
	swift build -c release --package-path ./Tools/Common --product swift-format
	swift build -c release --package-path ./Tools/Common --product xcodegen
	swift build -c release --package-path ./Tools/GenesisTool --product genesis
