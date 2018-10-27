"""
# module Namelist



# Examples

```jldoctest
julia>
```
"""
module Namelist

struct NamelistVariable{T}
    name::String
    value::T
    in_namelist::String
end

struct Namelist
    name::String
    values::Dict
end

end