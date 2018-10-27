"""
# module Cards



# Examples

```jldoctest
julia>
```
"""
module Cards

using Parsso.CoreDataStructure.Elements

abstract type Card end

struct AtomicSpecies <: Card
    values::Vector{Element}
end

end