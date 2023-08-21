import { StoreState } from 'redux/state'
import { ConfigProvider } from '_config/configProvider'

interface BaseRequestData {
  url: string
  defaultHeaders: {
    'x-api-version': number
  }
  userName?: string
  mail?: string
  phoneNumber?: string
  token?: string
}

export const getBaseRequestData = async (
  endpoint: string,
  state?: StoreState,
): Promise<BaseRequestData> => {
  return {
    url: `${ConfigProvider.config.api.baseUrl}${endpoint}`,
    defaultHeaders: {
      ...ConfigProvider.config.api.defaultHeaders,
    },
    userName: state?.auth.user?.name,
    mail: state?.auth.user?.email,
    phoneNumber: state?.auth.user?.phoneNumber,
    token: state?.auth.token,
  }
}
