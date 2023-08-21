export interface UpdateAccountRequest {
  userId: string
  name?: string
  email?: string
  phoneNumber?: string
  depositsTotalValue?: number
}
