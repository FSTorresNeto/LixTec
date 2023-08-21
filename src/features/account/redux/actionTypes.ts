import { UpdateUserForm } from './models/updateUserForm'

export enum AccountAction {
  UPDATE_ACCOUNT_START = 'UPDATE_ACCOUNT_START',
  UPDATE_ACCOUNT_SUCCESS = 'UPDATE_ACCOUNT_SUCCESS',
  UPDATE_ACCOUNT_FAIL = 'UPDATE_ACCOUNT_FAIL',
}

export interface UpdateAccountStartAction {
  type: AccountAction.UPDATE_ACCOUNT_START
}

export interface UpdateAccountSuccessAction {
  type: AccountAction.UPDATE_ACCOUNT_SUCCESS
  payload: UpdateUserForm
}

export interface UpdateAccountFailAction {
  type: AccountAction.UPDATE_ACCOUNT_FAIL
  payload: string
}

export type AccountActions =
  | UpdateAccountStartAction
  | UpdateAccountSuccessAction
  | UpdateAccountFailAction
