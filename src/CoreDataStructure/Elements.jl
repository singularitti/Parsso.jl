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
    get_element,
    get_atomic_species

struct AtomicSpecies
    symbol::String
    mass::Float64
    pseudopotential::String
end

AtomicSpecies(symbol::String, mass::Float64) = pseudopotential::String -> AtomicSpecies(symbol, mass, pseudopotential)
AtomicSpecies(symbol::String) = mass::Float64 -> AtomicSpecies(symbol, mass)

get_element(index::Symbol) = PeriodicTable.elements.bysymbol[(Symbol ∘ uppercasefirst ∘ String)(index)]
get_element(index::Int) = PeriodicTable.elements.bynumber[index]
get_element(index::String) = PeriodicTable.elements.byname[lowercase(index)]

function get_atomic_species(index::Union{Symbol, Int, String})
    element = get_element(index)  # Separate kernel functions (aka, function barriers)
    AtomicSpecies(element.symbol, element.atomic_mass.val)
end

end