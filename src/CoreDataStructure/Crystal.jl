"""
# module Crystal



# Examples

```jldoctest
julia>
```
"""
module Crystal

using StaticArrays: SVector, SMatrix, FieldVector

export CellParameters,
    CrystalFamily,
    Cubic, Hexagonal, Tetragonal, Orthorhombic, Monoclinic, Triclinic,
    CenteringType,
    Primitive, FaceCentered, BodyCentered, BaseCentered, RhombohedrallyCentered,
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
struct RhombohedrallyCentered <: CenteringType end

struct CellDimension <: FieldVector{6, Float64}
    a::Float64
    b::Float64
    c::Float64
    cosγ::Float64
    cosβ::Float64
    cosα::Float64
end

struct BravaisLattice{A <: CrystalFamily, B <: CenteringType}
    ibrav::Int
    celldm::CellDimension
end

BravaisLattice{A, B}(ibrav::Int) where {A, B} = celldm::AbstractArray{Float64, 1} -> BravaisLattice{A, B}(ibrav, CellDimension(celldm))

const CUBIC_LATTICE_SYSTEM = (BravaisLattice{Cubic, Primitive}(1), BravaisLattice{Cubic, FaceCentered}(2), BravaisLattice{Cubic, BodyCentered}(3))
const HEXAGONAL_LATTICE_SYSTEM = (BravaisLattice{Hexagonal, Primitive}(4),)
const RHOMBOHEDRAL_LATTICE_SYSTEM = (BravaisLattice{Hexagonal, RhombohedrallyCentered}(5), BravaisLattice{Hexagonal, RhombohedrallyCentered}(-5))
const TETRAGONAL_LATTICE_SYSTEM = (BravaisLattice{Tetragonal, Primitive}(6), BravaisLattice{Tetragonal, BodyCentered}(7))
const ORTHORHOMBIC_LATTICE_SYSTEM = (BravaisLattice{Orthorhombic, Primitive}(8), BravaisLattice{Orthorhombic, BaseCentered}(9),
    BravaisLattice{Orthorhombic, FaceCentered}(10), BravaisLattice{Orthorhombic, BodyCentered}(11))
const MONOCLINIC_LATTICE_SYSTEM = (BravaisLattice{Monoclinic, Primitive}(12), BravaisLattice{Monoclinic, Primitive}(-12),
    BravaisLattice{Monoclinic, BaseCentered}(13))
const TRICLINIC_LATTICE_SYSTEM = (BravaisLattice{Triclinic, Primitive}(14),)

function convert(b::BravaisLattice)::CellParameters
    ibrav = b.ibrav

end

[celldm.a 0 0; celldm.b * celldm.cosγ celldm.b * celldm.sinγ 0; 0 0 celldm.c]

end