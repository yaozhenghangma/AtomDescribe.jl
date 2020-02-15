abstract type AbstractFormat end

struct xyzFormat <: AbstractFormat 
    fileName::String
end

struct poscarFormat <: AbstractFormat
    fileName::String
end

function format(fileName::String)
    if (subfix = findlast(".", fileName)) !== nothing
        return xyzFormat(fileName)
    else
        return poscarFormat(fileName)
    end
end
