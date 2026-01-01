local beanz = {}

function beanz.run(Code:string)
  return require(script.excutor)(require(script.compiler)(Code))
end


return beanz