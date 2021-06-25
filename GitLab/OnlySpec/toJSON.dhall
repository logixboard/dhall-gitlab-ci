let Prelude = ../Prelude.dhall

let Map = Prelude.Map

let JSON = Prelude.JSON

let OnlySpec = ../OnlySpec/Type.dhall

let Optional/map = Prelude.Optional.map

let dropNones = ../utils/dropNones.dhall

let List/map = Prelude.List.map

let stringsArray
    : List Text → JSON.Type
    = λ(xs : List Text) →
        JSON.array (Prelude.List.map Text JSON.Type JSON.string xs)

let OnlySpec/toJSON
    : OnlySpec → JSON.Type
    = λ(os : OnlySpec) →
        let obj
            : Map.Type Text (Optional JSON.Type)
            = toMap
                { changes =
                    Optional/map (List Text) JSON.Type stringsArray os.changes
                , refs = Optional/map (List Text) JSON.Type stringsArray os.refs
                , variables =
                    Optional/map (List Text) JSON.Type stringsArray os.variables
                }

        in  JSON.object (dropNones Text JSON.Type obj)

in  OnlySpec/toJSON
