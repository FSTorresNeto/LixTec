import { AccountAction, AccountActions } from './actionTypes'
import {
  FailUpdateAccountDataState,
  InitialUpdateAccountDataState,
  LoadingUpdateAccountDataState,
  SuccessUpdateAccountDataState,
  UpdateAccountDataState,
} from './state'

const initialState: UpdateAccountDataState = new InitialUpdateAccountDataState()

export const authReducer = (state = initialState, action: AccountActions) => {
  switch (action.type) {
    case AccountAction.UPDATE_ACCOUNT_START:
      return new LoadingUpdateAccountDataState(state.user)

    case AccountAction.UPDATE_ACCOUNT_SUCCESS:
      return new SuccessUpdateAccountDataState(action.payload)

    case AccountAction.UPDATE_ACCOUNT_FAIL:
      return new FailUpdateAccountDataState(action.payload, state.user)

    default:
      return state
  }
}
