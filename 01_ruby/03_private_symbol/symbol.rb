# 次の要件を満たすクラス、SymbolManipulatorを作成してください
#
# 1.
# クラスメソッド `hash_key_switcher` を持ち、引数を一つ受け取ります
# 引数がハッシュのオブジェクトではない場合、何もせずオブジェクトをそのまま返します
#
# 2.
# `hash_key_switcher` は、引数のハッシュに次の操作をして、新しいハッシュを返します
#   a. 引数のハッシュのキーのうち、全てのStringオブジェクトをSymbolオブジェクトに変換し、バリューはそのまま保持します
#   b. 引数のハッシュのキーのうち、全てのSymbolオブジェクトをStringオブジェクトに変換し、バリューはそのまま保持します
#   b. 引数のハッシュのキーのうち、SymbolでもStringでもないものをSymbolオブジェクトに変換し、バリューはそのまま保持します
# すなわち、次の入力のときには、このような戻り値を期待します
# > input
#    { hoge: "foo", "piyo" => :boom, 1 => "one" }
# < output
#   { "hoge" => "foo", :piyo => :boom, :"1" => "one" }

class SymbolManipulator
  def self.hash_key_switcher(hash)
    return hash unless hash.is_a?(Hash)
    new_hash = {}
    hash.each do |key, value|
      if key.is_a?(String)
        new_hash[key.to_sym] = value
      elsif key.is_a?(Symbol)
        new_hash[key.to_s] = value
      else
        new_hash[key.to_s.to_sym] = value
      end
    end
    new_hash
  end
end
