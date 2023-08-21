import React from 'react'
import { useHistory } from 'react-router-dom'
import { ScanQrCodeView } from './ScanQrCode.view'
import { AccountRoutes } from 'features/account/constants/routes'
import { StoreState } from 'redux/state'
import { SuccessDepositState } from 'features/deposits/redux/state'
import { setError, createDeposit } from 'features/deposits/redux/actions'
import { useDispatch, useSelector } from 'react-redux'

export const ScanQrCode: React.FC = () => {
  const history = useHistory()
  const dispatch = useDispatch()

  const qrCode = useSelector((state: StoreState) => state.deposits)

  const user = useSelector((state: StoreState) => state.auth.user)

  React.useEffect(() => {
    if (qrCode instanceof SuccessDepositState) {
    }
  }, [qrCode, history])

  const onBackButton = () => {
    history.replace(AccountRoutes.home)
  }

  const handleError = (e: any) => {
    dispatch(setError('Não foi possível realizar a leitura.'))
  }

  const handleScan = (e: string | null) => {
    if (e)
      dispatch(
        createDeposit(e, user?.userId!, user?.depositsTotalValue.toString()!),
      )
  }

  return (
    <ScanQrCodeView
      onBackButton={onBackButton}
      handleError={handleError}
      handleScan={handleScan}
    />
  )
}
