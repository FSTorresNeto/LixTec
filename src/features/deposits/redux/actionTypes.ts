import { Deposit } from './models/Deposit'
import { TrashList } from './models/TrashList'
import {
  TrashListData,
  TrashListResponse,
} from './models/response/TrashListResponse'

export enum DepositActionTypes {
  DEPOSIT_START = 'DEPOSIT_START',
  DEPOSIT_SUCCESS = 'DEPOSIT_SUCCESS',
  DEPOSIT_FAIL = 'DEPOSIT_FAIL',

  UPDATE_DEPOSIT = 'UPDATE_DEPOSIT',

  TRASH_LIST_START = 'TRASH_LIST_START',
  TRASH_LIST_SUCCESS = 'TRASH_LIST_SUCCESS',
  TRASH_LIST_FAIL = 'TRASH_LIST_FAIL',

  UPDATE_TRASH_LIST = 'UPDATE_TRASH_LIST',

  SET_ERROR = 'SET_ERROR',
}

export interface CreateDepositStart {
  type: DepositActionTypes.DEPOSIT_START
}

export interface CreateDepositSuccess {
  type: DepositActionTypes.DEPOSIT_SUCCESS
  payload: boolean
}
export interface CreateDepositFail {
  type: DepositActionTypes.DEPOSIT_FAIL
  payload: string
}

export interface UpdateDepositAction {
  type: DepositActionTypes.UPDATE_DEPOSIT
  payload?: Deposit
}

export interface TrashListStart {
  type: DepositActionTypes.TRASH_LIST_START
}
export interface TrashListSuccess {
  type: DepositActionTypes.TRASH_LIST_SUCCESS
  payload: TrashListData[]
}
export interface TrashListFail {
  type: DepositActionTypes.TRASH_LIST_FAIL
  payload: string
}

export interface UpdateTrashListAction {
  type: DepositActionTypes.UPDATE_TRASH_LIST
  payload?: TrashListResponse[]
}

export interface SetErrorAction {
  type: DepositActionTypes.SET_ERROR
  payload: string
}

export type DepositAction =
  | CreateDepositStart
  | CreateDepositSuccess
  | CreateDepositFail
  | TrashListStart
  | TrashListSuccess
  | TrashListFail
  | SetErrorAction
