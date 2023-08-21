import { Api } from './api'
import dotenv from 'dotenv'

export interface ConfigData {
  api: Api
}

export class ConfigProvider {
  private static _config: ConfigData | undefined

  static get config(): ConfigData {
    if (!this._config) this._initialize()

    return this._config as ConfigData
  }

  private static _initialize() {
    dotenv.config()

    this._config = {
      api: {
        baseUrl: process.env.REACT_APP_API_URL || '',
        defaultHeaders: {
          'x-api-version': Number(process.env.REACT_APP_API_VERSION || 0),
        },
      },
    }
  }
}
