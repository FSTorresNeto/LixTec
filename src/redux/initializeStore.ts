import thunk from 'redux-thunk'
import { applyMiddleware, createStore } from 'redux'
import { rootReducer } from './rootReducer'
import { initialStoreState, StoreState } from './state'
import { composeWithDevTools } from 'redux-devtools-extension'

export const initializeStore = (initialState: StoreState = initialStoreState) =>
  createStore(
    rootReducer,
    initialState,
    composeWithDevTools(applyMiddleware(thunk)),
  )
