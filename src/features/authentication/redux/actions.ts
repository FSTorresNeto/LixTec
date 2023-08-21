import { Dispatch } from 'redux'
import {
  AuthAction,
  SignOutStartAction,
  SignOutFinishAction,
  UpdateAuthDataAction,
  SignInStartAction,
  SignInSuccessAction,
  SignInFailAction,
} from './actionTypes'
import { SignInRequest } from './models/request/signInRequest'
import { HttpClient } from '_config/http'
import { ApiResponse } from '_config/api'
import { getBaseRequestData } from '_utils/http'
import { SignInResponse } from './models/response/signInResponse'
import { User } from './models/user'
import { GetState } from 'redux/state'

export const login = (mail: string, password: string) => {
  return async (dispatch: Dispatch, getState: GetState) => {
    dispatch<SignInStartAction>({
      type: AuthAction.SIGN_IN_START,
    })
    try {
      const state = getState()
      const { url, defaultHeaders } = await getBaseRequestData(
        '/Auth/Authenticate',
        state,
      )

      const data: SignInRequest = {
        login: mail,
        password: password,
      }

      const response = await HttpClient.post<User>(url, data)

      dispatch<SignInSuccessAction>({
        type: AuthAction.SIGN_IN_SUCCESS,
        payload: response.data.data,
      })
    } catch (error: any) {
      let response: ApiResponse | undefined
      if (error.response) response = error.response?.data

      dispatch<SignInFailAction>({
        type: AuthAction.SIGN_IN_FAIL,
        payload: response?.message ?? error.message,
      })
    }
  }
}

export const updateAuthData = (data: User) => (dispatch: Dispatch) => {
  dispatch<UpdateAuthDataAction>({
    type: AuthAction.UPDATE_AUTH_DATA,
    payload: data,
  })
}

export const logout = () => async (dispatch: Dispatch) => {
  dispatch<SignOutStartAction>({
    type: AuthAction.SIGN_OUT_START,
  })
  dispatch<SignOutFinishAction>({
    type: AuthAction.SIGN_OUT_FINISH,
  })
}
