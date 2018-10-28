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

include("Reciprocal.jl")
@reexport using .Reciprocal

include("Namelists.jl")
@reexport using .Namelists

include("Cards.jl")
@reexport using .Cards

include("InputModel.jl")
@reexport using .InputModel

end