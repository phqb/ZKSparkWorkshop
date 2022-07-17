## Return summation of every number below and including n
## This function doesn't work with n < 0
func calculate_sum(n : felt) -> (sum : felt):
    if n == 0:
        return (n)
    end
    if n == 1:
        return (n)
    end

    let (res) = calculate_sum(n - 1)
    return (res + n)
end

