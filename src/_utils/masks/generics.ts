export const numericOnly = (value: string) => {
  return value.replace(/\D/g, '')
}

export const lettersOnly = (value: string) => {
  return value.replace(/[^a-zA-Z\u00C0-\u00FF ]+/g, '')
}
