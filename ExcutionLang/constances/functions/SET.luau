local Types = require(script.Parent.Parent.Types)

return {
  callback = function(compiledCode: Types.compiledCode, value)
    compiledCode.ActiveValue = value

    return compiledCode
  end,
}
