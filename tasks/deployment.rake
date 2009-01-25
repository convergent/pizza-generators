desc "Build the manifest and gemspec files."
task :build => [:build_manifest, :build_gemspec]

desc "Uninstall and retry deploying it locally"
task :retry => [:uninstall, :manifest, :gem, :install]
