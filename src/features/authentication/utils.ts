import { ConfigProvider } from '_config/configProvider'
import { HttpClient } from '_config/http'

export async function getApplicationToken() {
  const url = `${ConfigProvider.config.api.baseUrl}/auth`

  const response = await HttpClient.get(url, {
    headers: {
      ...ConfigProvider.config.api.defaultHeaders,
    },
  })

  return {
    'x-application-token': response.headers['x-application-token'],
  }
}

export const validateToken = (token: string) => {
  if (!token) return false

  const decoded: any = JSON.parse(atob(token.split('.')[1]))
  const exp = decoded.exp * 1000

  return Date.now() < exp
}
