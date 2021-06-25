let Prelude = ../Prelude.dhall

let Map = Prelude.Map

let JSON = Prelude.JSON

let EnvironmentSpec = ../EnvironmentSpec/Type.dhall

let Optional/map = Prelude.Optional.map

let dropNones = ../utils/dropNones.dhall

in  let EnvironmentSpec/toJSON
        : EnvironmentSpec → JSON.Type
        = λ(es : EnvironmentSpec) →
            let obj
                : Map.Type Text (Optional JSON.Type)
                = toMap
                    { name = Some (JSON.string es.name)
                    , url = Optional/map Text JSON.Type JSON.string es.url
                    }

            in  JSON.object (dropNones Text JSON.Type obj)

    in  EnvironmentSpec/toJSON
