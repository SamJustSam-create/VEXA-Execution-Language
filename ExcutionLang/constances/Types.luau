type valuesWstring = string | {string | number} | number
type values = {string | number} | number

export type Instruction = {
  instruction: string ,
  value: valuesWstring,
}


export type compiledCode = {
  instructions: {[number]:Instruction},
  cache: {[string]:number | {number}?},
  ActiveValue: number | {number}
}


export type func = {
  callback: (compiledCode , valuesWstring) -> compiledCode
}


export type SpecialValue = {
  canTakeNumber: boolean,
  canTakeMatrix: boolean,
  canTakeString: boolean,

  callback: (compiledCode , valuesWstring) -> values
}









return nil