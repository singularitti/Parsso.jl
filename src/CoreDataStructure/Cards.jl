"""
# module Cards



# Examples

```jldoctest
julia>
```
"""
module Cards

using Parsso.CoreDataStructure.Elements

export Card,
    OptionedCard

abstract type AbstractCard end

struct Card <: AbstractCard
    name::String
    values
end

struct OptionedCard <: AbstractCard
    name::String
    option::String
    values
end

end