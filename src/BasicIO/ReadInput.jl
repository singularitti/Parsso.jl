"""
# module ReadInput



# Examples

```jldoctest
julia>
```
"""
module ReadInput

using Parsso.CoreDataStructure

const NAMELIST_IDENTIFIERS = Dict(
    program => map(name -> string("&", name), names) for (program, names) in ALLOWED_NAMELISTS
)

const CARD_IDENTIFIERS = ALLOWED_CARDS



end