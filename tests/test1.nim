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
  timelog("p1", mytiming):
   let x = p1()

  echo x

  timelog("p2"):
  # timeOnce("p2"):
    p2()

when isMainModule:
  main()
