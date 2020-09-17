let upstream =
      https://github.com/kritzcreek/vessel-package-set/releases/download/mo-0.4.3-20200916/package-set.dhall sha256:3e1d8d20e35550bc711ae94f94da8b0091e3a3094f91874ff62686c070478dd7

let Package =
      { name : Text, version : Text, repo : Text, dependencies : List Text }

let additions = [] : List Package

let overrides = [
   { name = "base"
   , repo = "https://github.com/dfinity/motoko-base.git"
   , version = "f3fb7cb703be46589ad0fe2eefddbf72e2ce6386"
   , dependencies = [] : List Text
   }
]

in upstream # additions # overrides
