local beanz = {}

function beanz.run(Code:string)
  local startTime = time()
  local i = require(script.excutor)(require(script.compiler)(Code))

  --print(time() - startTime)
  return i
end




return beanz