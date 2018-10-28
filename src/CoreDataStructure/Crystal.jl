"""
# module Crystal



# Examples

```jldoctest
julia>
```
"""
module Crystal

using StaticArrays: SMatrix

export CellParameters

struct CellParameters
    coordinates::SMatrix{3, 3, Float64}
end

end