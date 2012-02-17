require "test/unit"
#sequence = [1,2,3,1,6,10]
#n = sequence.size
#k = 2
# answer = 21

#sequence = [9,9,9,9,9,9,9]
#n = sequence.size
#k = 2
# answer = 54


#n = 3
#k = 2
#sequence = []
#n.times{ sequence << 2000000000}


#params = STDIN.gets.split()
#n = params[0].gsub(",","").to_i
#k = params[1].gsub(",","").to_i
#sequence = []
#n.times{sequence << STDIN.gets.to_i}



##

def find_max(sequence,k)
    puts "Starting analysis for #{sequence.inspect}"
    max(sequence, k, 0)
end

def max(sequence, k, sum)
    if sequence.size > k + 2
        left = sequence[0..sequence.size/2 - 1]
        right = sequence[sequence.size/2..sequence.size]
        puts "left = #{left.inspect}"
        puts "right = #{right.inspect}"
        return max(left, k, sum) + max(right, k, sum)
    end

    sum = sequence.inject(:+)
    sum = sum - sequence.min if sequence.size > k
    puts "Looking for maximum of #{sequence.inspect} found #{sum}"
    sum
end

#puts max(sequence, k, 0)


class TestBillboards < Test::Unit::TestCase

    def test_one
        assert_equal 21, find_max([1,2,3,1,6,10], 2)
        assert_equal 2, find_max([1,1,1], 2)
        assert_equal 3, find_max([1,1,1,1], 2)
        assert_equal 20, find_max([1,1,9,9,1,1],2)
        assert_equal 36, find_max([9,9,1,1,9,9],2)
        assert_equal 2, find_max([1,1],2)
    end

    def test_two
    end

end




