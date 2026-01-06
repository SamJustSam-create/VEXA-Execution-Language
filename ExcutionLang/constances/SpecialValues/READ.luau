local Types = require(script.Parent.Parent.Types)



return {
  callback = function (compiledCode: Types.compiledCode , value)
    if compiledCode.ActiveValue then -- to shut up the linter
      return compiledCode.cache[value]
    end
    return nil
  end
}