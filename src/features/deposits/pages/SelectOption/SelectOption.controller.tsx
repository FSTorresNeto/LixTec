import React from 'react'
import { SelectOptionView } from './SelectOption.view'
import { CookiesProvider } from 'react-cookie'
import { useHistory } from 'react-router-dom'
import { DepositsRouter } from 'features/deposits/constants/routes'
import { AccountRoutes } from 'features/account/constants/routes'

export const SelectOption: React.FC = () => {
  const history = useHistory()

  const onMoveToHome = () => {
    history.push(AccountRoutes.home)
  }

  const onMoveToGenerateQrCode = () => {
    history.push(DepositsRouter.trashCanList)
  }

  return (
    <CookiesProvider>
      <SelectOptionView
        onMoveToHome={onMoveToHome}
        onMoveToGenerateQrCode={onMoveToGenerateQrCode}
      />
    </CookiesProvider>
  )
}
