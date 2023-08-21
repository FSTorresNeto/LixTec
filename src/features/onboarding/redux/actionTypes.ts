import { OnboardingForm } from './models/onboardingForm'

export enum OnboardingActions {
  CREATE_ACCOUNT_START = 'CREATE_ACCOUNT_START',
  CREATE_ACCOUNT_SUCCESS = 'CREATE_ACCOUNT_SUCCESS',
  CREATE_ACCOUNT_FAIL = 'CREATE_ACCOUNT_FAIL',

  UPDATE_ONBOARDING_FORM_DATA = 'UPDATE_ONBOARDING_FORM_DATA',

  CLOSE_ALERT = 'CLOSE_ALERT',
}

export interface CreateAccountStartAction {
  type: OnboardingActions.CREATE_ACCOUNT_START
}

export interface CreateAccountSuccessAction {
  type: OnboardingActions.CREATE_ACCOUNT_SUCCESS
}

export interface CreateAccountFailAction {
  type: OnboardingActions.CREATE_ACCOUNT_FAIL
  payload: string
}

export interface UpdateOnboardingFormDataAction {
  type: OnboardingActions.UPDATE_ONBOARDING_FORM_DATA
  payload?: OnboardingForm
}

export interface CloseAlertAction {
  type: OnboardingActions.CLOSE_ALERT
}

export type OnboardingAction =
  | CreateAccountStartAction
  | CreateAccountSuccessAction
  | CreateAccountFailAction
  | UpdateOnboardingFormDataAction
  | CloseAlertAction
