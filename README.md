# Timelog

A simple nimble package to log execution time

```nim
timelog("my_identifier"):
  callMyProc()
```

It is possible to hide the timing behind a define. Doing so will only log if `-d:mydefine` is passed to the Nim compiler 

```nim
timelog("my_identifier", mydefine):
  callMyProc()
```

# Documentation

## Read

https://clonkk.github.io/timelog/


## Generation

Generate documentation ``nimble doc src/timelog.nim --outdir:docs/``

