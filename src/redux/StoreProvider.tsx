import React from 'react'
import { Provider } from 'react-redux'
import { initialStoreState, StoreState } from './state'
import { initializeStore } from './initializeStore'

interface StoreProviderProps {
  initialState?: StoreState
  children: React.ReactNode
}

export const StoreProvider: React.FC<StoreProviderProps> = ({
  initialState = initialStoreState,
  children,
}) => {
  const store = initializeStore(initialState)

  return <Provider store={store}>{children}</Provider>
}
