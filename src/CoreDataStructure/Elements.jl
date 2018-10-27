"""
# module Elements



# Examples

```jldoctest
julia>
```
"""
module Elements

using FilePaths
using JSON

export Element,
    PeriodicTable

struct Element
    symbol::String
    mass::Float64
    pseudopotential::AbstractPath
end

Element(symbol, mass::Int, pseudopotential) = Element(symbol, convert(Float64, mass), pseudopotential)
Element(symbol::String, mass::Float64) = pseudopotential::AbstractPath -> Element(symbol, mass, pseudopotential)
Element(symbol::String, mass::Int) = Element(symbol, convert(Float64, mass))
Element(symbol::String) = mass::Float64 -> Element(symbol, mass)

open("data/PeriodicTableJSON.json") do f
    d = JSON.parse(f)["elements"]
    global PeriodicTable = Dict(
    number => Element(element["symbol"], element["atomic_mass"]) for (number, element) in enumerate(d)
)
end

end