export interface User {
  userId: string
  name: string
  email: string
  phoneNumber: string
  depositsTotalValue: number
  jwtToken?: string
}
