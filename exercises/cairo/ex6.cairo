%lang starknet

from starkware.cairo.common.bitwise import bitwise_and, bitwise_xor
from starkware.cairo.common.math_cmp import is_nn 
from starkware.cairo.common.cairo_builtins import BitwiseBuiltin

## Using binary operations return: 
## - 1 when the pattern of bits is alternating, excluding leading zeros
## - 0 otherwise

func pattern{bitwise_ptr: BitwiseBuiltin*, range_check_ptr}(n: felt, idx: felt, exp: felt, broken_chain: felt) -> (true : felt):
    let prev_exp = exp
    let curr_exp = exp * 2

    if prev_exp == 0:
        let (res) = pattern(n, idx, 1, broken_chain)
        return (res)
    end

    # if curr_exp > n, we are in the leading zeroes
    # NOTE: this doesn't work if n ~ 2^252
    let (is_larger) = is_nn(curr_exp - n) 
    if is_larger == 1:
        return (1)
    end

    let (prev_bit) = bitwise_and(n, prev_exp)
    let (curr_bit) = bitwise_and(n, curr_exp)
    let prev_bit_aligned = prev_bit * 2

    # if i-th bit is the same as (i-1)-th bit
    let (is_alternating) = bitwise_xor(prev_bit_aligned, curr_bit)
    if is_alternating == 0:
        return (0)
    end

    let (res) = pattern(n, idx, curr_exp, broken_chain)
    return (res)
end






