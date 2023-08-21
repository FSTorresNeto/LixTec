import { DepositAction } from './actionTypes'
import {
  DepositState,
  FailDepositState,
  InitialDepositState,
  SuccessDepositState,
} from './state'

const initialState: DepositState = new InitialDepositState()

export const depositsReducer = (
  state = initialState,
  action: DepositAction,
) => {
  switch (action.type) {
    case 'DEPOSIT_START':
    case 'TRASH_LIST_START':
      return new InitialDepositState(state.deposit, state.trashList)

    case 'DEPOSIT_SUCCESS':
      return new SuccessDepositState(state.trashList)

    case 'TRASH_LIST_SUCCESS':
      return new SuccessDepositState(action.payload)

    case 'DEPOSIT_FAIL':
    case 'TRASH_LIST_FAIL':
    case 'SET_ERROR':
      return new FailDepositState(
        action.payload,
        state.deposit,
        state.trashList,
      )

    default:
      return state
  }
}
