PHONY: xcodegen_project
xcodegen_project:
	bazelisk run @com_github_yonaskolb_xcodegen//:bin/xcodegen -- --spec src/xcodegen.yml && open src/XcodegenProject.xcodeproj
