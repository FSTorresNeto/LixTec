import bcrypt from 'bcryptjs'
let salt = bcrypt.genSaltSync(10)
let pin = ''
let newPin = ''

export const encryptPassword = (value: string) => {
  let hash = bcrypt.hashSync(value, salt)
  pin = value
  return hash
}

export const decryptPassword = () => {
  if (bcrypt.compareSync(pin, encryptPassword(pin))) return pin
}

export const encryptNewPassword = (value: string) => {
  let hash = bcrypt.hashSync(value, salt)

  if (!newPin.includes(value)) newPin = value

  return hash
}

export const decryptNewPassword = () => {
  if (bcrypt.compareSync(newPin, encryptNewPassword(newPin))) return newPin
}
