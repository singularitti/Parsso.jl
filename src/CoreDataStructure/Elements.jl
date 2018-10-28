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

AtomicSpecies(symbol::String, mass::Float64) = pseudopotential::AbstractPath -> AtomicSpecies(symbol, mass, pseudopotential)
AtomicSpecies(symbol::String) = mass::Float64 -> AtomicSpecies(symbol, mass)

const AtomicSpeciesFactory = (
    AtomicSpecies(element.symbol, element.atomic_mass.val) for element in PeriodicTable.elements
)

end