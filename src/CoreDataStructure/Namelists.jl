"""
# module Namelists



# Examples

```jldoctest
julia>
```
"""
module Namelists

export NamelistVariable,
    Namelist,
    CONTROL_NAMELIST

struct NamelistVariable{T}
    name::String
    in_namelist::String
    value::T
end

NamelistVariable(name::String, in_namelist::String, value::T) where T = NamelistVariable{T}(name, in_namelist, value)
NamelistVariable{T}(name::String, in_namelist::String) where T = value::T -> NamelistVariable(name, in_namelist, value)

struct Namelist
    name::String
    values::Dict
end

const CONTROL_NAMELIST_VARIABLES = [
    ("calculation", String),
    ("title", String),
    ("verbosity", String),
    ("restart_mode", String),
    ("wf_collect", Bool),
    ("nstep", Int),
    ("iprint", Int),
    ("tstress", Bool),
    ("tprnfor", Bool),
    ("dt", Float64),
    ("outdir", String),
    ("wfcdir", String),
    ("prefix", String),
    ("lkpoint_dir", Bool),
    ("max_seconds", Float64),
    ("etot_conv_thr", Float64),
    ("forc_conv_thr", Float64),
    ("disk_io", String),
    ("pseudo_dir", String),
    ("tefield", Bool),
    ("dipfield", Bool),
    ("lelfield", Bool),
    ("nberrycyc", Int),
    ("lorbm", Bool),
    ("lberry", Bool),
    ("gdir", Int),
    ("nppstr", Int),
    ("lfcpopt", Bool),
    ("gate", Bool)
]

const CONTROL_NAMELIST = Namelist("CONTROL", Dict(name => NamelistVariable{type}(name, "CONTROL") for (name, type) in CONTROL_NAMELIST_VARIABLES))

end