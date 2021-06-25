let Prelude = ../Prelude.dhall

let Map = Prelude.Map

let JSON = Prelude.JSON

let ServiceSpec = ../ServiceSpec/Type.dhall

let Optional/map = Prelude.Optional.map

let dropNones = ../utils/dropNones.dhall

let ServiceSpec/toJSON
    : ServiceSpec → JSON.Type
    = λ(ss : ServiceSpec) →
        let obj
            : Map.Type Text (Optional JSON.Type)
            = toMap
                { name = Some (JSON.string ss.name)
                , alias = Optional/map Text JSON.Type JSON.string ss.alias
                }

        in  JSON.object (dropNones Text JSON.Type obj)

in  ServiceSpec/toJSON
