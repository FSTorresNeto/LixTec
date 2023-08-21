import { Dispatch } from 'redux'
import { HttpClient } from '_config/http'
import { ApiResponse } from '_config/api'
import { getBaseRequestData } from '_utils/http'
import { GetState } from 'redux/state'
import { UpdateAccountRequest } from './models/request/updateAccountRequest'
import { UpdateUserForm } from './models/updateUserForm'
import {
  UpdateAccountStartAction,
  UpdateAccountSuccessAction,
  UpdateAccountFailAction,
  AccountAction,
} from './actionTypes'

export const updateAccount = (
  userId: string,
  name: string,
  mail: string,
  phoneNumber: string,
  depositsTotalValue?: number,
) => {
  return async (dispatch: Dispatch, getState: GetState) => {
    dispatch<UpdateAccountStartAction>({
      type: AccountAction.UPDATE_ACCOUNT_START,
    })
    try {
      const state = getState()
      const { url, token } = await getBaseRequestData(
        '/User/UpdateUserData',
        state,
      )

      const data: UpdateAccountRequest = {
        userId: userId,
        name: name,
        email: mail,
        phoneNumber: phoneNumber,
      }

      if (mail === null || mail === '') {
        data.email = state.auth.user?.email
      }
      if (phoneNumber === null || phoneNumber === '') {
        data.phoneNumber = state.auth.user?.phoneNumber
      }
      if (name === null || name === '') {
        data.name = state.auth.user?.name
      }
      alert(data.email)

      const response = await HttpClient.post<UpdateUserForm>(url, data, {
        headers: { Authorization: `Bearer ${token}` },
      })

      dispatch<UpdateAccountSuccessAction>({
        type: AccountAction.UPDATE_ACCOUNT_SUCCESS,
        payload: response.data.data,
      })
    } catch (error: any) {
      let response: ApiResponse | undefined
      if (error.response) response = error.response?.data

      dispatch<UpdateAccountFailAction>({
        type: AccountAction.UPDATE_ACCOUNT_FAIL,
        payload: response?.message ?? error.message,
      })
    }
  }
}
