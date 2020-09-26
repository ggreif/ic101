let upstream =
      https://github.com/kritzcreek/vessel-package-set/releases/download/mo-0.4.3-20200916/package-set.dhall sha256:3e1d8d20e35550bc711ae94f94da8b0091e3a3094f91874ff62686c070478dd7

let Package =
      { name : Text, version : Text, repo : Text, dependencies : List Text }

let additions = [] : List Package

let base = [
   { name = "matchers"
   , repo = "git@github.com:kritzcreek/motoko-matchers.git"
   , version = "v0.1.3"
   , dependencies = ["base"]
   },
   { name = "base"
   , repo = "file:///Users/ggreif/motoko-base"
   , version = "43fe5fa8909971f7106498ea9bcdc8fdfa4d1e23"
   , dependencies = [] : List Text
   }
]

let overrides = base : List Package

in  upstream # additions # overrides
