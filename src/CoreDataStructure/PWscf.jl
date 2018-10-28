"""
# module PWscf



# Examples

```jldoctest
julia>
```
"""
module PWscf

struct PWscfInput
    namelists::Vector{Namelist}
    cards::Vector{Card}
end

end