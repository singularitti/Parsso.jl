"""
# module InputModel



# Examples

```jldoctest
julia>
```
"""
module InputModel

abstract type AbstractInput end

struct NamelistsOnlyInput <: AbstractInput
    program::String
    namelists::Vector{Namelist}
end

struct NamelistsCardsInput <: AbstractInput
    program::String
    namelists::Vector{Namelist}
    cards::Vector{Card}
end

end