local SpecialValues = script.Parent.constances.SpecialValues
local functions = script.Parent.constances.functions


local Types = require(script.Parent.constances.Types)

local function SpecialValue(compiledCode , line:string)
  local split = line:split(`"`)

  if SpecialValues:FindFirstChild(split[1]) then
    local Special:Types.SpecialValue = require(SpecialValues:FindFirstChild(split[1]))

    return Special.callback(compiledCode, split[2])
  else
    return split[2]
  end
end


local function ExcuteInstruction(compiledCode:Types.compiledCode , func: string , value: number | {number} | string)
  if functions:FindFirstChild(func) then
    local funcInfo: Types.func = require(functions:FindFirstChild(func))


    return funcInfo.callback(compiledCode, value)
  end
  return compiledCode
end

return function(compiledCode: Types.compiledCode)
  for i , V in compiledCode.instructions do
    local value = V.value

    if typeof(value) == "string" and tonumber(value) == nil then

      value = SpecialValue(compiledCode, value)

    elseif typeof(value) == "table" then

      for m , V in value do 
        if typeof(V) == "string" and tonumber(V) == nil then
          value[m] = SpecialValue(compiledCode, V)
        else
          value[m] = tonumber(V)
        end
      end
    end

    compiledCode = ExcuteInstruction(compiledCode , V.instruction , value)
  end

  print(compiledCode.ActiveValue)
end