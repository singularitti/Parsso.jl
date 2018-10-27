"""
# module Reciprocal



# Examples

```jldoctest
julia>
```
"""
module Reciprocal

export KPoint

struct KPoint
    coordinates::Vector{Float64}
    weight::Float64
end

end