# frozen_string_literal: true

namespace :testpuma do
  desc 'Restart Puma'
  task :restartss do
    on roles(:app) do
      within current_path.to_s do
        execute 'rails restart'
      end
    end
  end
end
