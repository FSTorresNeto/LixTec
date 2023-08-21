import { combineReducers } from 'redux'
import { initialStoreState, StoreState } from './state'
import { AuthAction } from '../features/authentication/redux/actionTypes'
import { authReducer } from '../features/authentication/redux/reducer'
import { depositsReducer } from '../features/deposits/redux/reducer'
import { activateOnboardingReducer } from '../features/onboarding/redux/reducer'

export const appReducer = combineReducers({
  auth: authReducer,
  onboarding: activateOnboardingReducer,
  deposits: depositsReducer,
})

export const rootReducer = (
  state: StoreState = initialStoreState,
  action: any,
): StoreState => {
  if (action.type === AuthAction.SIGN_OUT_FINISH) return initialStoreState

  return appReducer(state, action)
}
