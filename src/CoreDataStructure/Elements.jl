"""
# module Elements



# Examples

```jldoctest
julia>
```
"""
module Elements

using FilePaths

export Element

struct Element
    symbol::String
    mass::Float64
    pseudopotential::AbstractPath
end

end