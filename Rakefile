
desc "Run cucumber test with headless browser"
task :headless do
  sh "export HEADLESS=true && bundle exec cucumber env=dev"
end

desc "Run cucumber test in Dev environment"
task :dev do
  sh 'bundle exec cucumber env=dev '
end

task :t, :tag do |t,args|
  args.with_defaults(:tag => "plan")
  sh "bundle exec cucumber env=dev -t @#{args[:tag]}"
end

desc "Run cucumber test in CI"
task :ci do
  sh 'bundle exec cucumber env=ci --format json -o cucumber.json'
end

task :default => :dev

