"""
# module Elements



# Examples

```jldoctest
julia>
```
"""
module Elements

import PeriodicTable

export AtomicSpecies,
    AtomicSpeciesFactory

struct AtomicSpecies
    symbol::String
    mass::Float64
    pseudopotential::String
end

AtomicSpecies(symbol::String, mass::Float64) = pseudopotential::String -> AtomicSpecies(symbol, mass, pseudopotential)
AtomicSpecies(symbol::String) = mass::Float64 -> AtomicSpecies(symbol, mass)

const AtomicSpeciesFactory = Dict(
    element.name => AtomicSpecies(element.symbol, element.atomic_mass.val) for element in PeriodicTable.elements
)

end