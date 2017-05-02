namespace :db do
  task :recycle => [:drop, :create, :migrate]
end
