local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Types = require(ReplicatedStorage.Shared.ExcutionLang.constances.Types)



return {
  callback = function (compiledCode: Types.compiledCode , value)
    if compiledCode.ActiveValue then -- to shut up the linter
      return compiledCode.cache[value]
    end
    return nil
  end
}