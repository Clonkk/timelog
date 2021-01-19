import timelog
import logging
import os

addHandler(newConsoleLogger(levelThreshold = lvlInfo, fmtStr = verboseFmtStr))

proc p1(): string =
  sleep(1_234)
  return "hello"

proc p2() =
  sleep(1_234)

proc main()=
  block:
    timelog("p1", mytiming):
     let x = p1()
    doAssert x == "hello"

    timelog("p2"):
      p2()

  block:
    timeIt("p1"):
      let x = p1()
    doAssert x == "hello"

    timeIt("p2"):
      p2()

when isMainModule:
  main()
