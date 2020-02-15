export Coulomb

mutable struct Coulomb <: MoleculeDescribe
    number::Int64
    value::Array{Float64, 1}

    Coulomb() = new(0, [])
    function Coulomb(molecule::Atoms)
        coulombMatrix = Array{Float64, 2}(undef, Atoms.number, Atoms.number)
        for i in 1:(Atoms.number-1)
            chargeI = getCharge(Atoms.atom[i].symbol)
            coulombMatrix[i, i] = chargeI^2.4

            for j in (i+1):(Atoms.number-1)
                chargeJ = getCharge(Atoms.atom[j].symbol)
                distance = dist(Atoms.atom[i], Atoms.atom[j])
                coulombMatrix[i, j] = chargeI * chargeJ / distance
                coulombMatrix[j, i] = coulombMatrix[i, j]
            end
        end

        eigenValues = eigvals(coulombMatrix)
        sort!(eigenValues, rev=true)

        new(Atoms.number, eigenValues)
    end
end
