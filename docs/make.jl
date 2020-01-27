using Documenter, AtomDescribe

makedocs(;
    modules=[AtomDescribe],
    format=Documenter.HTML(),
    pages=[
        "Home" => "index.md",
    ],
    repo="https://github.com/yaozhenghangma/AtomDescribe.jl/blob/{commit}{path}#L{line}",
    sitename="AtomDescribe.jl",
    authors="Yaozhenghang Ma",
    assets=String[],
)

deploydocs(;
    repo="github.com/yaozhenghangma/AtomDescribe.jl",
)
