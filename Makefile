translations:
	@# Create/update ts files
	lupdate multiupv2.pro
	@# Start Linguist to do the translation work for english
	linguist multiupManager_en.ts
	@# Compile the .qm file
	lrelease multiupv2.pro