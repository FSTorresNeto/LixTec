import axios, { AxiosInstance, AxiosRequestConfig } from 'axios'
import { ApiResponse } from './api'

interface RequestConfig extends AxiosRequestConfig {}

export class HttpClient {
  private static _axios: AxiosInstance = axios.create()

  static get<TData extends {}>(url: string, config?: RequestConfig) {
    return this._axios.get<TData>(url, config)
  }

  static post<TData extends {}>(
    url: string,
    data: Object,
    config?: RequestConfig,
  ) {
    return this._axios.post<ApiResponse<TData>>(url, data, config)
  }

  static put<TData extends {}>(
    url: string,
    data: Object,
    config?: RequestConfig,
  ) {
    return this._axios.put<ApiResponse<TData>>(url, data, config)
  }

  static delete(url: string, config?: RequestConfig) {
    return this._axios.delete(url, config)
  }
}
