import { AuthAction, AuthActions } from './actionTypes'
import {
  AuthState,
  InitialAuthenticatedState,
  LoadingAuthState,
  SuccessAuthState,
  FailAuthState,
} from './state'

const initialState: AuthState = new InitialAuthenticatedState()

export const authReducer = (state = initialState, action: AuthActions) => {
  switch (action.type) {
    case AuthAction.SIGN_IN_START:
    case AuthAction.SIGN_OUT_START:
      return new LoadingAuthState(state.user)

    case AuthAction.SIGN_IN_SUCCESS:
      return new SuccessAuthState(action.payload)

    case AuthAction.SIGN_IN_FAIL:
      return new FailAuthState(action.payload, state.user)

    case AuthAction.UPDATE_AUTH_DATA:
      if (!action.payload) return new InitialAuthenticatedState(state.user)
      else
        return new InitialAuthenticatedState({
          ...state.user,
          ...action.payload!,
        })

    case AuthAction.SIGN_OUT_FINISH:
      return new InitialAuthenticatedState()

    default:
      return state
  }
}
