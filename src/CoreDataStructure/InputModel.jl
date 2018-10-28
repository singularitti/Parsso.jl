"""
# module InputModel



# Examples

```jldoctest
julia>
```
"""
module InputModel

const QE_PROGRAMS = (
    "bands.x",
    "bgw2pw.x",
    "cp.x",
    "cppp.x",
    "dos.x",
    "turbo_eels.x",
    "turbo_lanczos.x",
    "ld1.x",
    "molecularpdos.x",
    "neb.x",
    "ph.x",
    "pp.x",
    "projwfc.x",
    "pw.x",
    "pw2bgw.x",
    "pw2gw.x",
    "pw_export.x",
    "pwcond.x",
    "turbo_spectrum.x"
)

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