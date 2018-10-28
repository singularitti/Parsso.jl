"""
# module InputModel



# Examples

```jldoctest
julia>
```
"""
module InputModel

using Parsso.CoreDataStructure.Namelists
using Parsso.CoreDataStructure.Cards

export NamelistsInput,
    NamelistsCardsInput

abstract type AbstractInput end

struct NamelistsInput <: AbstractInput
    program::String
    namelists::Vector{Namelist}
    function NamelistsInput(program, namelists)
        program in QE_PROGRAMS || throw(DomainError("The program $program is not recognized!"))
        new(program, namelists)
    end
end

struct NamelistsCardsInput <: AbstractInput
    program::String
    namelists::Vector{Namelist}
    cards::Vector{Card}
    function NamelistsCardsInput(program, namelists, cards)
        program in QE_PROGRAMS || throw(DomainError("The program $program is not recognized!"))
        new(program, namelists, cards)
    end
end

end