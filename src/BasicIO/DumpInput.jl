"""
# module DumpInput



# Examples

```jldoctest
julia>
```
"""
module DumpInput

using FilePaths

export dumps,
    dump

dumps(v::NamelistVariable) = string(v.name, " = ", fstring(v.value))

dumps(n::Namelist) = "\&$(uppercase(n.name))\n" * join([dumps(v) * ",\n" for v in n.values]) * "/\n"

dumps(c::Card) = "$(uppercase(c.name))\n" * dumps(c.values)

dumps(c::OptionedCard) = "$(uppercase(c.name)) \{ $(c.option) \}\n" * dumps(c.values)

dumps(input::NamelistsInput) = join([dumps(namelist) for namelist in input.namelists])

dumps(input::NamelistsCardsInput) = (join ∘ append!)([dumps(namelist) for namelist in input.namelists], [dumps(card) for card in input.cards])

dump(io::IO, input::AbstractInput) = write(io, dumps(input))

dump(path::AbstractPath, input::AbstractInput) = open(path, "w") do f
    dump(f, input)
end

end