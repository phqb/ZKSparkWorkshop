# https://github.com/starkware-libs/cairo-lang/blob/master/src/starkware/cairo/common/uint256.cairo
from starkware.cairo.common.uint256 import Uint256, uint256_add

# Modify both functions so that they
# incremented value by one and return it
func addOne(y : felt) -> (bit : felt):   
   return (bit=y + 1) 
end

func addOneU256{range_check_ptr}(y : Uint256) -> (bit : Uint256):   
    let (res, _) = uint256_add(y, Uint256(low=1, high=0))
   return (bit=res)
end
