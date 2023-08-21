import { User } from './models/user'

export enum AuthAction {
  SIGN_IN_START = 'SIGN_IN_START',
  SIGN_IN_SUCCESS = 'SIGN_IN_SUCCESS',
  SIGN_IN_FAIL = 'SIGN_IN_FAIL',

  UPDATE_AUTH_DATA = 'UPDATE_AUTH_DATA',

  SIGN_OUT_START = 'SIGN_OUT_START',
  SIGN_OUT_FINISH = 'SIGN_OUT_FINISH',
}

export interface SignInStartAction {
  type: AuthAction.SIGN_IN_START
}

export interface SignInSuccessAction {
  type: AuthAction.SIGN_IN_SUCCESS
  payload: User
}

export interface SignInFailAction {
  type: AuthAction.SIGN_IN_FAIL
  payload: string
}

export interface UpdateAuthDataAction {
  type: AuthAction.UPDATE_AUTH_DATA
  payload?: User
}

export interface SignOutStartAction {
  type: AuthAction.SIGN_OUT_START
}

export interface SignOutFinishAction {
  type: AuthAction.SIGN_OUT_FINISH
}

export type AuthActions =
  | SignInStartAction
  | SignInSuccessAction
  | SignInFailAction
  | SignOutStartAction
  | SignOutFinishAction
  | UpdateAuthDataAction
