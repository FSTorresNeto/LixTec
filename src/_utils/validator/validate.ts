const numbers = /(?=.*\d)/g
const upperCase = /(?=.*[A-Z])/g
const lowerCase = /(?=.*[a-z])/g

export const validateLowerCase = (value: string) => {
  return lowerCase.test(value)
}

export const validateUpperCase = (value: string) => {
  return upperCase.test(value)
}

export const validateNumbers = (value: string) => {
  return numbers.test(value)
}

export const validateLowerUpperNumber = (value: string) => {
  return numbers.test(value) && lowerCase.test(value) && upperCase.test(value)
}

export const validateLength = (value: string) => {
  return value.length > 7 && value.length < 17
}

export const validateEmail = (email: string) => {
  const re = /^[a-z0-9.]+@[a-z0-9]+\.[a-z]+/i
  return re.test(email)
}
