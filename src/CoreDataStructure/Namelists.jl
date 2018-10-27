"""
# module Namelists



# Examples

```jldoctest
julia>
```
"""
module Namelists

struct NamelistVariable{T}
    name::String
    in_namelist::String
    value::T
end

NamelistVariable(name::String, in_namelist::String, value::T) where T = NamelistVariable{T}(name, in_namelist, value)
NamelistVariable{T}(name::String, in_namelist::String) where T = value::T -> NamelistVariable(name, in_namelist, value)

struct Namelist
    name::String
    values::Dict
end


end