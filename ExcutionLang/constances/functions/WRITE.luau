local Types = require(script.Parent.Parent.Types)

return {

  callback = function(compiledCode: Types.compiledCode, value)
    compiledCode.cache[value] = compiledCode.ActiveValue

    return compiledCode
  end,
}
