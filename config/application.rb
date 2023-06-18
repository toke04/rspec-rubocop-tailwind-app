require_relative "boot"

require "rails/all"

Bundler.require(*Rails.groups)

module RspecRubocopTailwindApp
  class Application < Rails::Application
    config.load_defaults 7.0

    config.generators do |g| # ここから追記
      g.assets false          # CSS, JavaScriptファイルを自動生成しない
      g.helper     false
      g.test_framework :rspec, # ここから5行を追記
                       fixtures: false, # テストDBにレコードを作るfixtureの作成をスキップ(FactoryBotを使用するため)
                       view_specs: false, # ビューファイル用のスペックを作成しない
                       helper_specs: false, # ヘルパーファイル用のスペックを作成しない
                       routing_specs: false # routes.rb用のスペックファイル作成しない# helperファイルを自動生成しない
    end  # ここまで追記
  end
end
