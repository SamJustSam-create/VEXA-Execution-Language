local Types = require(script.Parent.Parent.Types)

return {
  callback = function(compiledCode: Types.compiledCode, value)
    if compiledCode.ActiveValue == nil then
      return compiledCode
    end

    if typeof(compiledCode.ActiveValue) == "table" then
      if typeof(value) == "table" then
        for i, _ in compiledCode.ActiveValue do
          if value[i] then
            compiledCode.ActiveValue[i] -= value[i]
          end
        end
      else
        for i, _ in compiledCode.ActiveValue do
          compiledCode.ActiveValue[i] -= value
        end
      end
    else
      if typeof(value) == "table" then
        local comp = compiledCode.ActiveValue
        compiledCode.ActiveValue = {} :: { number }
        for i, V in value do
          if typeof(compiledCode.ActiveValue) == "table" then
            compiledCode.ActiveValue[i] = comp - V
          end
        end
      else
        compiledCode.ActiveValue -= value
      end
    end

    return compiledCode
  end,
}
