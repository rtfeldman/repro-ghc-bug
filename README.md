This is a minimal reproduction of [**GHC bug #14781** Incorrect CPU core counts in virtualized environments](https://ghc.haskell.org/trac/ghc/ticket/14781#ticket)

It consists of one file, `main.hs`, which prints [`Control.Concurrent.getNumCapabilities`](https://hackage.haskell.org/package/base-4.10.1.0/docs/Control-Concurrent.html#v:getNumCapabilities):

```haskell
import Control.Concurrent

main =
  print =<< getNumCapabilities
```

To run locally:

```bash
$ ghc -O2 -threaded --make main.hs -o reproduce
$ ./reproduce
```

This should print the number of available CPU cores on your machine.

On [Travis CI](https://travis-ci.org/), `main.hs` should print `2` because 2 cores are available to the virtualized environment in which it's running. Instead, it prints 32, which is the number of *physical* cores on the machine.

[Here is an example on Travis showing the incorrect output of 32.](https://travis-ci.org/rtfeldman/repro-ghc-bug/builds/340268785) (Scroll to the end of the log output to see the failure.)

In contrast, Rust's [`num_cpus` implementation](https://github.com/seanmonstar/num_cpus/blob/8708466bedd9acb84cc46c7e7890285a9d0b1356/src/lib.rs) correctly outputs 2 on Travis.
