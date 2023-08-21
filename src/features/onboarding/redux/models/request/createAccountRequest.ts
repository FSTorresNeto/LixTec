export interface CreateAccountRequest {
  email: string
  phoneNumber: string
  name: string
  password: string
  terms?: boolean
}
