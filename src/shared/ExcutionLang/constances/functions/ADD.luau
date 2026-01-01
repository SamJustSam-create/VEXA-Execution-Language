local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Types = require(ReplicatedStorage.Shared.ExcutionLang.constances.Types)



return {
  canTakeNumber = true,
  canTakeMatrix = true,
  canTakeString = true,

  callback = function (compiledCode: Types.compiledCode , value)

    if compiledCode.ActiveValue == nil then
      return compiledCode
    end



    if typeof(compiledCode.ActiveValue) == "table" then
      if typeof(value) == "table" then

        for i , V in compiledCode.ActiveValue do
          if value[i] then
            compiledCode.ActiveValue[i] += value[i]
          end
        end

      else

        for i , V in compiledCode.ActiveValue do
          compiledCode.ActiveValue[i] += value
        end
      end
      
    else
      if typeof(value) == "table" then
        local comp = compiledCode.ActiveValue
        compiledCode.ActiveValue = {} :: {number}

        for i , V in value do
          if typeof(compiledCode.ActiveValue) == "table" then
            compiledCode.ActiveValue[i] = comp + V
          end
        end
      end
    end
  




    return compiledCode
  end
}