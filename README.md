# Optimizing Compiler infrastructure

official [LLVM BOLT tutorial](https://github.com/facebookincubator/BOLT/blob/main/bolt/docs/OptimizingClang.md) implemented in `nix`.

Seen as the base for optimizing compiler infrastructure easily available out-of-the box.


## Status

basically **not yet implemented**

## Disclaimer

This is experimental project for the author to hack around in his spare time and comes without any guarantees of project's reaching the state of minimum usability and / or feature completness.

No assumptions currently should be made about contents / availability of this repo. _Everything_ here is a subject to changes or permanent deletion, including this disclaimer, as well as the repo itself might become temporarily or permanently unavailale.

## Scope

As basically every modern compiler is optimizing, to avoid ambiguity, the scope of this project is well defined and is all about ensuring BOLT support, both:
- for bootstrapping compilers themselves and thus speeding up compilation
- ensuring BOLT is supported by compilers to build other software

With lesser priority, PGO and LTO are also in the scope and will be enabled by default, if that doesn't occur to slow down the development (read "just works", givent the current author's setup).


## Platforms

- `Apple Silicon` as _the first class citizen_ (thanks to being the author's only machine at the moment; however it's in progress and may not work in the end)
- `x86_64`

## Roadmap
- make it work to any extent
- `rustc` support
- `go 1.18+` support
- creation of a collection of `nix-shell` build environments which use optimizing compilers
- overriding / overlaying the `nixpkgs` packages which would greately benefit from being built by optimizing compiler [and are not configured this way by default]
e.g.: nixpkgs versions of Python


## Links
- [nix wiki tutorial to build LLVM](https://nixos.wiki/wiki/LLVM)
- [BOLT by Facebook Incubator](https://github.com/facebookincubator/BOLT)
- [Optimizing Clang : A Practical Example of Applying BOLT](https://github.com/facebookincubator/BOLT/blob/main/bolt/docs/OptimizingClang.md)
- [State of BOLT in rustc](https://github.com/rust-lang/rust/issues/50655)
- [State of PGO in rustc](https://github.com/rust-lang/rust/issues/50655)
- [Some numbercrunching from Phoronix regarding BOLT / LTO / PGO](https://www.phoronix.com/news/LLVM-Lands-BOLT) 

