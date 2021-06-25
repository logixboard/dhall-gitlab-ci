let Prelude = ../Prelude.dhall

let Image = ../Image/Type.dhall

let Script = ../Script/Type.dhall

let ArtifactsSpec = ../ArtifactsSpec/Type.dhall

let CacheSpec = ../CacheSpec/Type.dhall

let Rule = ../Rule/Type.dhall

let OnlySpec = ../OnlySpec/Type.dhall

let EnvironmentSpec = ../EnvironmentSpec/Type.dhall

let ServiceSpec = ../ServiceSpec/Type.dhall

in    { stage = None Text
      , image = None Image
      , variables = Prelude.Map.empty Text Text
      , rules = None (List Rule)
      , dependencies = [] : List Text
      , needs = [] : List Text
      , allow_failure = False
      , tags = None (List Text)
      , before_script = None Script
      , script = [] : Script
      , services = None (List ServiceSpec)
      , after_script = None Script
      , cache = None CacheSpec
      , artifacts = None ArtifactsSpec
      , except = None (List Text)
      , only = None OnlySpec
      , environment = None EnvironmentSpec
      }
    : ./Type.dhall
