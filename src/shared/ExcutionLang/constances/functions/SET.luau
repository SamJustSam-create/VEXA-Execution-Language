local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Types = require(ReplicatedStorage.Shared.ExcutionLang.constances.Types)



return {
  callback = function (compiledCode: Types.compiledCode , value)

    compiledCode.ActiveValue = value

  return compiledCode
end
}