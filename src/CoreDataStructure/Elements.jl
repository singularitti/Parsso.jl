"""
# module Elements



# Examples

```jldoctest
julia>
```
"""
module Elements

using FilePaths
import PeriodicTable

export AtomicSpecies,
    AtomicSpeciesFactory

struct AtomicSpecies
    symbol::String
    mass::Float64
    pseudopotential::AbstractPath
end

Element(symbol, mass::Int, pseudopotential) = Element(symbol, convert(Float64, mass), pseudopotential)
Element(symbol::String, mass::Float64) = pseudopotential::AbstractPath -> Element(symbol, mass, pseudopotential)
Element(symbol::String, mass::Int) = Element(symbol, convert(Float64, mass))
Element(symbol::String) = mass::Float64 -> Element(symbol, mass)

const AtomicSpeciesFactory = (
    AtomicSpecies(element.symbol, element.atomic_mass.val) for element in PeriodicTable.elements
)

end