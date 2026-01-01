local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Types = require(ReplicatedStorage.Shared.ExcutionLang.constances.Types)



return {
  canTakeNumber = true,
  canTakeMatrix = true,
  canTakeString = false,

  callback = function (compiledCode: Types.compiledCode , value)

  compiledCode.cache[value] = compiledCode.ActiveValue

  return compiledCode
end
}