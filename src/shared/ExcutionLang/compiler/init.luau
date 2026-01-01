local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Config = require(ReplicatedStorage.Shared.ExcutionLang.constances.Config)
local types = require(script.Parent.constances.Types)

local functions = script.Parent.constances.functions


local OgPrint = print
local OgError = error

local function print(Text:any)
  OgPrint(`[{script.Name}]` , Text)
end

local function error(Text:any , level)
  level = level or 1
  OgError(`[{script.Name}] {Text}`  , level)
end





local function RemoveWhiteSpace(Code:string)
  local newString = ""

  local last = ""

  for _ , V in Code:split("") do
    if V == " " or V == "\t" then
      if last ~= " " and last ~= "\t" and last ~= ";" and last ~= ":" then
        newString ..= ":"
        last = ":"
        continue
      elseif last == ";" or last == ":" then
        continue
      end
    elseif V == "\n" then
      continue
    else
      newString ..= V
    end
    last = V
  end




  return newString
end


local function MakeInstruction(Line:string)
  local split = Line:split(":")
  local instruction: types.Instruction = {instruction = split[1] , value = ""}

  local isTable = if Line:match("{") then true else false

  if isTable then
    instruction.value = split[2]:split("{")[2]:split("}")[1]:split(",")
  else
    instruction.value = split[2]
  end

  if Config.CompilerFunctionCheck then
    if functions:FindFirstChild(instruction.instruction) == nil then
      error(`{instruction.instruction} Not found in functions folder`)
    end

  end


  return instruction
end



return function(Code: string ) : types.compiledCode
  local template: types.compiledCode = {instructions = {} , cache = {}, ActiveValue = 0}

  Code = RemoveWhiteSpace(Code)


  print(Code)
  for _ , V in Code:split(";") do
    table.insert(template.instructions , MakeInstruction(V))
  end

  print(template)


  return template
end