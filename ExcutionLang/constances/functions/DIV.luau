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
            if value[i] == 0 then
              error("Division by zero")
            end
            compiledCode.ActiveValue[i] /= value[i]
          end
        end
      else
        if value == 0 then
          error("Division by zero")
        end
        for i, _ in compiledCode.ActiveValue do
          compiledCode.ActiveValue[i] /= value
        end
      end
    else
      if typeof(value) == "table" then
        local comp = compiledCode.ActiveValue
        compiledCode.ActiveValue = {} :: { number }
        for i, V in value do
          if V == 0 then
            error("Division by zero")
          end
          if typeof(compiledCode.ActiveValue) == "table" then
            compiledCode.ActiveValue[i] = comp / V
          end
        end
      else
        if value == 0 then
          error("Division by zero")
        end
        compiledCode.ActiveValue /= value
      end
    end

    return compiledCode
  end,
}
