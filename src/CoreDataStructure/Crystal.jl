"""
# module Crystal



# Examples

```jldoctest
julia>
```
"""
module Crystal

using StaticArrays: SMatrix

export CellParameters,
    CrystalFamily,
    Cubic, Hexagonal, Tetragonal, Orthorhombic, Monoclinic, Triclinic,
    CenteringStyle,
    Primitive, FaceCentered, BodyCentered, BaseCentered

struct CellParameters
    coordinates::SMatrix{3, 3, Float64}
end

abstract type CrystalFamily end

struct Cubic <: CrystalFamily end
struct Hexagonal <: CrystalFamily end
struct Tetragonal <: CrystalFamily end
struct Orthorhombic <: CrystalFamily end
struct Monoclinic <: CrystalFamily end
struct Triclinic <: CrystalFamily end

abstract type CenteringStyle end

struct Primitive <: CenteringStyle end
struct FaceCentered <: CenteringStyle end
struct BodyCentered <: CenteringStyle end
struct BaseCentered <: CenteringStyle end
struct Rhombohedral <: CenteringStyle end

struct BravisLattice{A <: CrystalFamily, B <: CenteringStyle}
    ibrav::Int
    celldm::Vector{Float64}
end

BravisLattice{A, B}(ibrav::Int) where {A, B} = celldm::Vector{Float64} -> BravisLattice{A, B}(ibrav, celldm)

const CUBIC_LATTICE_SYSTEM = (BravisLattice{Cubic, Primitive}(1), BravisLattice{Cubic, FaceCentered}(2), BravisLattice{Cubic, BodyCentered}(3))
const HEXAGONAL_LATTICE_SYSTEM = (BravisLattice{Hexagonal, Primitive}(4),)
const TRIGONAL_LATTICE_SYSTEM = (BravisLattice{Hexagonal, Rhombohedral}(5), BravisLattice{Hexagonal, Rhombohedral}(-5))
const TETRAGONAL_LATTICE_SYSTEM = (BravisLattice{Tetragonal, Primitive}(6), BravisLattice{Tetragonal, BodyCentered}(7))
const ORTHORHOMBIC_LATTICE_SYSTEM = (BravisLattice{Orthorhombic, Primitive}(8), BravisLattice{Orthorhombic, BaseCentered}(9),
    BravisLattice{Orthorhombic, FaceCentered}(10), BravisLattice{Orthorhombic, BodyCentered}(11))
const MONOCLINIC_LATTICE_SYSTEM = (BravisLattice{Monoclinic, Primitive}(12), BravisLattice{Monoclinic, Primitive}(-12),
    BravisLattice{Monoclinic, BaseCentered}(13))
const TRICLINIC_LATTICE_SYSTEM = (BravisLattice{Triclinic, Primitive}(14),)

end