local SpecialValues = script.Parent.constances.SpecialValues
local functions = script.Parent.constances.functions

local Types = require(script.Parent.constances.Types)

local function SpecialValue(compiledCode, line: string)
  local split = line:split(`(`)

  if SpecialValues:FindFirstChild(split[1]) then
    local Special: Types.SpecialValue = require(SpecialValues:FindFirstChild(split[1]))
    local value = ""

    if split[2] then
      if split[2]:split(")")[1]:split(`"`)[2] then
        value = split[2]:split(")")[1]:split(`"`)[2]
      end
    end

    return Special.callback(compiledCode, value)
  else
    return line:split(`"`)[2]
  end
end

local function ExcuteInstruction(compiledCode: Types.compiledCode, func: string, value: number | { number } | string)
  if functions:FindFirstChild(func) then
    local funcInfo: Types.func = require(functions:FindFirstChild(func))
    --print(compiledCode)

    return funcInfo.callback(compiledCode, value)
  end
  return compiledCode
end

return function(compiledCode: Types.compiledCode)
  for _, V in compiledCode.instructions do
    local value = V.value

    if typeof(value) == "string" and tonumber(value) == nil then
      value = SpecialValue(compiledCode, value)
    elseif typeof(value) == "table" then
      for m, v in value do
        if typeof(v) == "string" and tonumber(v) == nil then
          value[m] = SpecialValue(compiledCode, v)
        else
          value[m] = tonumber(v)
        end
      end
    end

    compiledCode = ExcuteInstruction(compiledCode, V.instruction, value)
  end

  --print(compiledCode.ActiveValue)
  return compiledCode.ActiveValue
end
