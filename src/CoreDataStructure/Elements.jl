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

Element(symbol::String, mass::Float64) = pseudopotential::AbstractPath -> Element(symbol, mass, pseudopotential)
Element(symbol::String) = mass::Float64 -> Element(symbol, mass)

end