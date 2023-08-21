import {
  AuthState,
  InitialAuthenticatedState,
} from '../features/authentication/redux/state'
import {
  DepositState,
  InitialDepositState,
} from '../features/deposits/redux/state'
import {
  OnboardingState,
  InitialOnboardingState,
} from '../features/onboarding/redux/state'

export interface StoreState {
  auth: AuthState
  onboarding: OnboardingState
  deposits: DepositState
}

export const initialStoreState: StoreState = {
  auth: new InitialAuthenticatedState(),
  onboarding: new InitialOnboardingState(),
  deposits: new InitialDepositState(),
}

export type GetState = () => StoreState
