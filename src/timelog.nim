import std/monotimes
import logging
import times

template timeit*(name: string, body) =
  ## Time execution of code using monoTime and log the result
  runnableExamples:
    var seq = newSeq[int]
    timeit("my-test-case"):
      for i in 1..1e6:
        seq.add (i*i)

  let t0 = getMonoTime()
  body
  let elapsed = (getMonoTime() - t0)
  info(name, " timings ", elapsed)

template timeit*(name: string, timingcond: untyped, body) =
  ## Time execution of code if ``timingcond``is defined
  ## This allows for conditional time measurement without changing code
  runnableExamples:
    var seq = newSeq[int]
    # Only evaluate if ``-d:mytimingdefine`` has been passed to the compiler 
    timeit("my-test-case", mytimingdefine):
      for i in 1..1e6:
        seq.add (i*i)

  when defined(timingcond):
    timeit(name, body)
  else:
    body

