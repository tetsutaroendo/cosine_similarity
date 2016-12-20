require 'matrix'

module CosineSimilarity

  module_function

  def combination_calc(group)
    # 集団のデータをベクトルに変換し、正規化
    normalized_vectors = {}
    group.each do |g|
      normalized_vectors[g.first] = Vector.elements(g.last).normalize
    end

    # 組み合わせごとのコサイン類似度を出力
    normalized_vectors.keys.combination(2) do |v1k, v2k|
      puts "#{v1k} - #{v2k} = #{normalized_vectors[v1k].inner_product(normalized_vectors[v2k])}"
    end
  end
end

writers = {
  :kotaro_isaka => [3, 2, 1, 1],
  :keigo_higashino => [2, 2, 1, 0],
  :haruki_murakami => [1, 1, 2, 1],
  :j_k_rowling => [1, 0, 1, 3]
}

CosineSimilarity.combination_calc(writers)
