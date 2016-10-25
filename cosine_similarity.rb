class CosineSimilarity
  class << self

    def numer(m_i, m_j)
      result = 0.0
      m_i.each_with_index do |m_i, t|
        result += m_i * m_j[t]
      end
      result
    end

    def square_root(m)
      result_m = 0.0
      m.each do |m|
        result_m += m ** 2.0
      end
      Math.sqrt(result_m)
    end

    def denom(m_i, m_j)
      CosineSimilarity.square_root(m_i) * CosineSimilarity.square_root(m_j)
    end

    def sim(m_i, m_j)
      CosineSimilarity.numer(m_i, m_j) / CosineSimilarity.denom(m_i, m_j)
    end

    def combination_calc(hash)
      vector_names = hash.keys
      for i in 0..vector_names.length-1
        for j in i+1..vector_names.length-1
          puts "#{vector_names[i]}-#{vector_names[j]} = #{CosineSimilarity.sim(hash[vector_names[i].to_sym], hash[vector_names[j].to_sym])}"
        end
      end
    end
  end
end


vectors = {
  :sample_vector1 => [3, 2, 1, 1],
  :sample_vector2 => [2, 2, 1, 0],
  :sample_vector3 => [1, 1, 2, 1],
  :sample_vector4 => [1, 0, 1, 3]
}

CosineSimilarity.combination_calc(vectors)
