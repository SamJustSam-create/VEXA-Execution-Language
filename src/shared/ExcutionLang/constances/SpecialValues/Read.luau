local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Types = require(ReplicatedStorage.Shared.ExcutionLang.constances.Types)



return {
  canTakeNumber = true,
  canTakeMatrix = true,
  canTakeString = true,

  callback = function (compiledCode: Types.compiledCode , value)
    if compiledCode.ActiveValue then -- to shut up the linter
      compiledCode.cache[value] = compiledCode.ActiveValue
    end
   

    return compiledCode
  end
}