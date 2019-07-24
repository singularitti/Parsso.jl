"""
# module Reciprocal



# Examples

```jldoctest
julia>
```
"""
module Reciprocal

using StaticArrays: SVector

export KPoint

struct KPoint
    coordinates::SVector{3, Float64}
    weight::Float64
end

end