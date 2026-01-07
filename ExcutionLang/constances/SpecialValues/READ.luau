local Types = require(script.Parent.Parent.Types)

return {
  callback = function(compiledCode: Types.compiledCode, value)
    if compiledCode.cache[value] == nil then
      error(`Cache key "{value}" not found`)
    end
    return compiledCode.cache[value]
  end,
}
