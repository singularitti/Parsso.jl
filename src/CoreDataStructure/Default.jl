"""
# module Default



# Examples

```jldoctest
julia>
```
"""
module Default

export QE_PROGRAMS,
    ALLOWED_CARDS,
    ALLOWED_NAMELISTS

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

const ALLOWED_NAMELISTS = Dict(
    "pw.x" => ("CONTROL", "SYSTEM", "ELECTRONS", "IONS", "CELL")
)

const ALLOWED_CARDS = Dict(
    "pw.x" => ("ATOMIC_SPECIES", "ATOMIC_POSITIONS", "K_POINTS", "CELL_PARAMETERS", "CONSTRAINTS", "OCCUPATIONS", "ATOMIC_FORCES")
)

end