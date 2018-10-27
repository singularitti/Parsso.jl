"""
# module CoreDataStructure



# Examples

```jldoctest
julia>
```
"""
module CoreDataStructure

using Reexport

include("Elements.jl")
@reexport using .Elements

include("Namelists.jl")
@reexport using .Namelists

include("Cards.jl")
@reexport using .Cards

end