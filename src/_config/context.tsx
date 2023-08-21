import React from 'react'
import { ConfigData, ConfigProvider } from './configProvider'

export const ConfigContext = React.createContext<ConfigData>(
  ConfigProvider.config,
)

export const ConfigContextProvider: React.FC = ({ children }) => {
  return (
    <ConfigContext.Provider value={ConfigProvider.config}>
      {children}
    </ConfigContext.Provider>
  )
}
