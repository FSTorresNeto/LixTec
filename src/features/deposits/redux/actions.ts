import { Dispatch } from 'redux'
import { ApiResponse } from '_config/api'
import { HttpClient } from '_config/http'
import { GetState } from 'redux/state'
import { getBaseRequestData } from '_utils/http'
import {
  CreateDepositFail,
  CreateDepositStart,
  CreateDepositSuccess,
  DepositActionTypes,
  SetErrorAction,
  TrashListFail,
  TrashListStart,
  TrashListSuccess,
} from './actionTypes'
import { DepositsRequest } from './models/request/depositRequest'
import { TrashList } from './models/TrashList'
import {
  TrashListData,
  TrashListResponse,
} from './models/response/TrashListResponse'

export const createDeposit =
  (hasCode: string, userId: string, depositsTotalValue: string) =>
  async (dispatch: Dispatch, getState: GetState) => {
    dispatch<CreateDepositStart>({
      type: DepositActionTypes.DEPOSIT_START,
    })
    try {
      const state = getState()
      const { url, token } = await getBaseRequestData('/Deposits', state)

      const data: DepositsRequest = {
        hasCode: hasCode,
        userId: userId,
        depositsTotalValue: depositsTotalValue,
      }

      const response = await HttpClient.post(url, data, {
        headers: { Authorization: `Bearer ${token}` },
      })

      dispatch<CreateDepositSuccess>({
        type: DepositActionTypes.DEPOSIT_SUCCESS,
        payload: response.data.success,
      })
    } catch (error: any) {
      let response: ApiResponse | undefined
      if (error.response) response = error.response?.data

      dispatch<CreateDepositFail>({
        type: DepositActionTypes.DEPOSIT_FAIL,
        payload: response?.message ?? error.message,
      })
    }
  }

export const setError = (message: string) => (dispatch: Dispatch) => {
  dispatch<SetErrorAction>({
    type: DepositActionTypes.SET_ERROR,
    payload: message,
  })
}

export const trashList =
  () => async (dispatch: Dispatch, getState: GetState) => {
    dispatch<TrashListStart>({
      type: DepositActionTypes.TRASH_LIST_START,
    })

    try {
      const state = getState()
      const { url, defaultHeaders } = await getBaseRequestData(
        '/Trash/GetAll',
        state,
      )

      const response = await HttpClient.get<TrashListResponse>(url)

      console.log(response.data.data)
      dispatch<TrashListSuccess>({
        type: DepositActionTypes.TRASH_LIST_SUCCESS,
        payload: response.data.data,
      })
    } catch (error: any) {
      let response: ApiResponse | undefined
      if (error.response) response = error.response?.data

      dispatch<TrashListFail>({
        type: DepositActionTypes.TRASH_LIST_FAIL,
        payload: response?.message ?? error.message,
      })
    }
  }
