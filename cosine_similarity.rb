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

  def combination_calc(vector_hash)
    vector_hash.keys.combination(2) do |a, b|
      puts "#{a}-#{b} = #{CosineSimilarity.sim(vector_hash[a.to_sym], vector_hash[b.to_sym])}"
    end
  end
end


vectors1 = {
  :sample_vector1 => [3, 2, 1, 1],
  :sample_vector2 => [2, 2, 1, 0],
  :sample_vector3 => [1, 1, 2, 1],
  :sample_vector4 => [1, 0, 1, 3]
}

vectors2 = {
  :sample_vector5 => [2, 2, 2, 2, 2, 2, 2, 0, 1, 1, 0 ,0],
  :sample_vector6 => [0, 0, 0, 2, 2, 0, 2, 2, 2, 2, 1 ,1]
}

CosineSimilarity.combination_calc(vectors1)
CosineSimilarity.combination_calc(vectors2)
