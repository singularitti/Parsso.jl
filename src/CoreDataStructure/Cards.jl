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

struct CellParameters <: Card
    option::String
    values::Matrix{Float64}
end

struct AtomicPositions <: Card
    option::String
    values::Vector
end

struct KPoints <: Card
    option::String
    values
end

end