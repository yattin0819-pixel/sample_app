ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

class ActiveSupport::TestCase
  # 指定されたプロセッサ数でテストを並列実行する
  # もしエラーが続く場合は、ここをコメントアウトするとデバッグしやすくなります
  # parallelize(workers: :number_of_processors)

  # すべてのテストで利用するfixtureをセットアップ
  fixtures :all
  include ApplicationHelper

  # テストユーザーがログイン中の場合にtrueを返す
  def is_logged_in?
    !session[:user_id].nil?
  end

  # テストユーザーとしてログインする（単体テスト用）
  def log_in_as(user)
    session[:user_id] = user.id
    session[:session_token] = user.session_token
  end
end

class ActionDispatch::IntegrationTest
  # テストユーザーとしてログインする（統合テスト用）
  def log_in_as(user, password: 'password', remember_me: '1')
    post login_path, params: { session: { email: user.email,
                                          password: password,
                                          remember_me: remember_me } }
    # ログイン後にセッション・トークンを同期して、コントローラーのチェックをパスさせる

  end
end
