let upstream =
      https://github.com/kritzcreek/vessel-package-set/releases/download/mo-0.4.3-20200916/package-set.dhall sha256:3e1d8d20e35550bc711ae94f94da8b0091e3a3094f91874ff62686c070478dd7

let Package =
      { name : Text, version : Text, repo : Text, dependencies : List Text }

let additions = [] : List Package

let overrides = [
   { name = "base"
   , repo = "https://github.com/dfinity/motoko-base.git"
   , version = "d0b0aa8aa9e5c7c5044c5cb866990af29db8f6ca"
   , dependencies = [] : List Text
   }
]

in upstream # additions # overrides
