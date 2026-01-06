type ValueWithString = string | {string | number} | number
type Value = {string | number} | number

export type Instruction = {
  instruction: string ,
  value: ValueWithString,
}


export type compiledCode = {
  instructions: {[number]:Instruction},
  cache: {[string]:number | {number}?},
  ActiveValue: number | {number}
}


export type func = {
  callback: (compiledCode , ValueWithString) -> compiledCode
}


export type SpecialValue = {
  callback: (compiledCode , ValueWithString) -> Value
}









return nil