export interface Api {
  baseUrl: string
  defaultHeaders: {
    'x-api-version': number
  }
}

export interface ApiRequest {
  accountId: number
  userId: number
  toPhoneNumber?: string
}

export interface ApiResponse<TData extends {} = {}> {
  success: true
  data: TData
  message: string
}
