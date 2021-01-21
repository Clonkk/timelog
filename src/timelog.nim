import std/monotimes
import logging
import times

template timeIt*(name: string, body) =
  ## Time execution of code using monoTime and echo the result
  let t0 = getMonoTime()
  body
  let elapsed = inMicroseconds(getMonoTime() - t0)
  echo(name, " timings ", elapsed, " µs")

template timeLog*(name: string, body) =
  ## Time execution of code using monoTime and log the result
  runnableExamples:
    import sequtils
    var seq = newSeq[int]()
    timelog("my-test-case"):
      for i in 1..1_000_000:
        seq.add (i*i)

  let t0 = getMonoTime()
  body
  let elapsed = inMicroseconds(getMonoTime() - t0)
  info(name, " timings ", elapsed, " µs")

template timeLog*(name: string, timingcond: untyped, body) =
  ## Time execution of code if ``timingcond``is defined
  ## This allows for conditional time measurement without changing code
  runnableExamples:
    import sequtils
    var seq = newSeq[int]()
    # Only evaluate if ``-d:mytimingdefine`` has been passed to the compiler
    timelog("my-test-case", mytimingdefine):
      for i in 1..1_000_000:
        seq.add (i*i)

  when defined(timingcond):
    timelog(name, body)
  else:
    body

