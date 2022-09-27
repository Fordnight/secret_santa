namespace :testpuma do
  desc 'Restart Puma'
  task :restartss do
    on roles(:app) do
      within "#{current_path}" do
        execute "rails restart"
      end
    end
  end
end