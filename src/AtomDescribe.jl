module AtomDescribe

using LinearAlgebra
using AtomBase
using XYZFiles

abstract type AbstractDescribe end
abstract type MoleculeDescribe <: AbstractDescribe end

export AbstractDescribe, MoleculeDescribe

function getCharge(symbol::String)
    if symbol == "H"
        return 1.0
    elseif symbol == "C"
        return 12.0
    elseif symbol == "N"
        return 14.0
    elseif symbol == "O"
        return 16.0
    end
    #TODO: Throw unknown chemical symbol.
end

function dist(atom1::T, atom2::T) where {T<:AbstractAtom}
    distanceSquare = 0.0
    for i in 1:3
        distanceSquare += (atom1.position[i]-atom2.position[i])^2
    end
    return sqrt(distanceSquare)
end

include("fileFormat.jl")
include("coulomb.jl")

function formatRead(fileFormat::xyzFormat)
    return XYZFiles.read(fileFormat.fileName, ["energy",])
end

end # module
