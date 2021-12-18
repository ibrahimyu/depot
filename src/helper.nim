import jsony

proc fillJson*[T](s: string, x: var T) =
  var i = 0
  s.parseHook(i, x)