"""
# module Crystal



# Examples

```jldoctest
julia>
```
"""
module Crystal

using StaticArrays: SVector, SMatrix

export CellParameters,
    CrystalFamily,
    Cubic, Hexagonal, Tetragonal, Orthorhombic, Monoclinic, Triclinic,
    CenteringType,
    Primitive, FaceCentered, BodyCentered, BaseCentered, RCentered,
    CUBIC_LATTICE_SYSTEM,
    HEXAGONAL_LATTICE_SYSTEM,
    RHOMBOHEDRAL_LATTICE_SYSTEM,
    TETRAGONAL_LATTICE_SYSTEM,
    ORTHORHOMBIC_LATTICE_SYSTEM,
    MONOCLINIC_LATTICE_SYSTEM,
    TRICLINIC_LATTICE_SYSTEM

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

abstract type CenteringType end

struct Primitive <: CenteringType end
struct FaceCentered <: CenteringType end
struct BodyCentered <: CenteringType end
struct BaseCentered <: CenteringType end
struct RCentered <: CenteringType end

struct BravisLattice{A <: CrystalFamily, B <: CenteringType}
    ibrav::Int
    celldm::SVector{6, Float64}
end

BravisLattice{A, B}(ibrav::Int) where {A, B} = celldm::AbstractArray{Float64, 1} -> BravisLattice{A, B}(ibrav, SVector{6, Float64}(celldm))

const CUBIC_LATTICE_SYSTEM = (BravisLattice{Cubic, Primitive}(1), BravisLattice{Cubic, FaceCentered}(2), BravisLattice{Cubic, BodyCentered}(3))
const HEXAGONAL_LATTICE_SYSTEM = (BravisLattice{Hexagonal, Primitive}(4),)
const RHOMBOHEDRAL_LATTICE_SYSTEM = (BravisLattice{Hexagonal, RCentered}(5), BravisLattice{Hexagonal, RCentered}(-5))
const TETRAGONAL_LATTICE_SYSTEM = (BravisLattice{Tetragonal, Primitive}(6), BravisLattice{Tetragonal, BodyCentered}(7))
const ORTHORHOMBIC_LATTICE_SYSTEM = (BravisLattice{Orthorhombic, Primitive}(8), BravisLattice{Orthorhombic, BaseCentered}(9),
    BravisLattice{Orthorhombic, FaceCentered}(10), BravisLattice{Orthorhombic, BodyCentered}(11))
const MONOCLINIC_LATTICE_SYSTEM = (BravisLattice{Monoclinic, Primitive}(12), BravisLattice{Monoclinic, Primitive}(-12),
    BravisLattice{Monoclinic, BaseCentered}(13))
const TRICLINIC_LATTICE_SYSTEM = (BravisLattice{Triclinic, Primitive}(14),)

end