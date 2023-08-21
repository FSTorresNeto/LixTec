import { OnboardingAction, OnboardingActions } from './actionTypes'
import {
  OnboardingState,
  InitialOnboardingState,
  LoadingOnboardingState,
  SuccessOnboardingState,
  FailOnboardingState,
} from './state'

const initialState: OnboardingState = new InitialOnboardingState()

export const activateOnboardingReducer = (
  state = initialState,
  action: OnboardingAction,
) => {
  switch (action.type) {
    case OnboardingActions.CREATE_ACCOUNT_START:
      return new LoadingOnboardingState(state.onboardingForm)

    case OnboardingActions.CREATE_ACCOUNT_SUCCESS:
      return new SuccessOnboardingState(state.onboardingForm)

    case OnboardingActions.CREATE_ACCOUNT_FAIL:
      return new FailOnboardingState(action.payload, state.onboardingForm)

    case OnboardingActions.UPDATE_ONBOARDING_FORM_DATA:
      return new SuccessOnboardingState(action.payload)

    case OnboardingActions.CLOSE_ALERT:
      return new InitialOnboardingState(state.onboardingForm)

    default:
      return state
  }
}
