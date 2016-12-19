module CosineSimilarity

  module_function

  def number(m_i, m_j)
    result = 0.0
    0.upto(m_i.length-1) do |i|
      result += m_i[i] * m_j[i]
    end
    result
  end

  def square_root(m)
    Math.sqrt(m.inject(0.0){|sum, f| sum + (f ** 2.0)})
  end

  def denom(m_i, m_j)
    CosineSimilarity.square_root(m_i) * CosineSimilarity.square_root(m_j)
  end

  def sim(m_i, m_j)
    CosineSimilarity.number(m_i, m_j) / CosineSimilarity.denom(m_i, m_j)
  end

  def combination_calc(vectors)
    vectors.keys.combination(2) do |v1, v2|
      puts "#{v1} - #{v2} = #{CosineSimilarity.sim(vectors[v1.to_sym], vectors[v2.to_sym])}"
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
