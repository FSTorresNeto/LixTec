import { Dispatch } from 'redux'
import { GetState } from 'redux/state'
import { ApiResponse } from '_config/api'
import { HttpClient } from '_config/http'
import { getBaseRequestData } from '_utils/http'
import {
  CloseAlertAction,
  CreateAccountFailAction,
  CreateAccountStartAction,
  CreateAccountSuccessAction,
  OnboardingActions,
  UpdateOnboardingFormDataAction,
} from './actionTypes'
import { OnboardingForm } from './models/onboardingForm'
import { CreateAccountRequest } from './models/request/createAccountRequest'
import { CreateUserResponse } from './models/response/login'

export const createAccount =
  (
    mail: string,
    userName: string,
    password: string,
    phoneNumber: string,
    terms: boolean,
  ) =>
  async (dispatch: Dispatch, getState: GetState) => {
    dispatch<CreateAccountStartAction>({
      type: OnboardingActions.CREATE_ACCOUNT_START,
    })
    try {
      const state = getState()
      const { url, defaultHeaders } = await getBaseRequestData(
        '/User/CreateNewUser',
        state,
      )

      const data: CreateAccountRequest = {
        name: userName,
        email: mail,
        phoneNumber: phoneNumber,
        password: password,
        terms: terms,
      }

      const response = await HttpClient.post<CreateUserResponse>(url, data)

      dispatch<CreateAccountSuccessAction>({
        type: OnboardingActions.CREATE_ACCOUNT_SUCCESS,
      })
    } catch (error: any) {
      let response: ApiResponse | undefined
      if (error.response) response = error.response?.data

      dispatch<CreateAccountFailAction>({
        type: OnboardingActions.CREATE_ACCOUNT_FAIL,
        payload: response?.message ?? error.message,
      })
    }
  }

export const updateOnboardingForm =
  (data?: OnboardingForm) => (dispatch: Dispatch) => {
    dispatch<UpdateOnboardingFormDataAction>({
      type: OnboardingActions.UPDATE_ONBOARDING_FORM_DATA,
      payload: data,
    })
  }

export const closeAlert = () => (dispatch: Dispatch) => {
  dispatch<CloseAlertAction>({
    type: OnboardingActions.CLOSE_ALERT,
  })
}

export const updateAccountData =
  (mail: string, phoneNumber: string, userName: string, password: string) =>
  async (dispatch: Dispatch, getState: GetState) => {
    dispatch<CreateAccountStartAction>({
      type: OnboardingActions.CREATE_ACCOUNT_START,
    })
    try {
      const state = getState()
      const { url, defaultHeaders } = await getBaseRequestData(
        '/User/UpdateUserData',
        state,
      )

      const data: CreateAccountRequest = {
        name: userName,
        email: mail,
        phoneNumber: phoneNumber,
        password: password,
      }

      await HttpClient.post(url, data, {
        headers: {
          ...defaultHeaders,
        },
      })

      dispatch<CreateAccountSuccessAction>({
        type: OnboardingActions.CREATE_ACCOUNT_SUCCESS,
      })
    } catch (error: any) {
      let response: ApiResponse | undefined
      if (error.response) response = error.response?.data

      dispatch<CreateAccountFailAction>({
        type: OnboardingActions.CREATE_ACCOUNT_FAIL,
        payload: response?.message ?? error.message,
      })
    }
  }
