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

struct BravaisLattice{A <: CrystalFamily, B <: CenteringType}
    ibrav::Int
    celldm::SVector{6, Float64}
end

BravaisLattice{A, B}(ibrav::Int) where {A, B} = celldm::AbstractArray{Float64, 1} -> BravaisLattice{A, B}(ibrav, SVector{6, Float64}(celldm))

const CUBIC_LATTICE_SYSTEM = (BravaisLattice{Cubic, Primitive}(1), BravaisLattice{Cubic, FaceCentered}(2), BravaisLattice{Cubic, BodyCentered}(3))
const HEXAGONAL_LATTICE_SYSTEM = (BravaisLattice{Hexagonal, Primitive}(4),)
const RHOMBOHEDRAL_LATTICE_SYSTEM = (BravaisLattice{Hexagonal, RCentered}(5), BravaisLattice{Hexagonal, RCentered}(-5))
const TETRAGONAL_LATTICE_SYSTEM = (BravaisLattice{Tetragonal, Primitive}(6), BravaisLattice{Tetragonal, BodyCentered}(7))
const ORTHORHOMBIC_LATTICE_SYSTEM = (BravaisLattice{Orthorhombic, Primitive}(8), BravaisLattice{Orthorhombic, BaseCentered}(9),
    BravaisLattice{Orthorhombic, FaceCentered}(10), BravaisLattice{Orthorhombic, BodyCentered}(11))
const MONOCLINIC_LATTICE_SYSTEM = (BravaisLattice{Monoclinic, Primitive}(12), BravaisLattice{Monoclinic, Primitive}(-12),
    BravaisLattice{Monoclinic, BaseCentered}(13))
const TRICLINIC_LATTICE_SYSTEM = (BravaisLattice{Triclinic, Primitive}(14),)

end