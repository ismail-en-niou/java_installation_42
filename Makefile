SCRIPT=install_java21.sh
JAVA_VERSION=21-tem

.PHONY: all chmod run remove help

all: help

chmod:
	@echo "🔑 Setting permissions for $(SCRIPT) to 777..."
	chmod 777 $(SCRIPT)
	@echo "✅ Permissions set!"

run: chmod
	@echo "🚀 Running $(SCRIPT)..."
	./$(SCRIPT)

remove:
	@echo "🗑 Removing Java $(JAVA_VERSION)..."
	@bash -c "source $$HOME/.sdkman/bin/sdkman-init.sh && sdk uninstall java $(JAVA_VERSION) --force"
	@echo "✅ Java $(JAVA_VERSION) removed!"

help:
	@echo ""
	@echo "Makefile targets:"
	@echo "  make chmod    → Give execute permissions to $(SCRIPT)"
	@echo "  make run      → Run $(SCRIPT) to install Java 21"
	@echo "  make remove   → Uninstall Java 21 via SDKMAN"
	@echo "  make help     → Show this message"
	@echo ""
