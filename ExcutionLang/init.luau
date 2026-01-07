local beanz = {}

function beanz.run(Code: string)
  local i = require(script.excutor)(require(script.compiler)(Code))

  return i
end

return beanz
