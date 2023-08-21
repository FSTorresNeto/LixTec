import React from 'react'
import { AccountSettingsView } from './AccountSettings.view'
import { useHistory } from 'react-router-dom'
import { useDispatch, useSelector } from 'react-redux'
import { StoreState } from 'redux/state'
import { validateEmail } from '_utils/validator/validate'
import { AccountRoutes } from 'features/account/constants/routes'
import { updateAccount } from 'features/account/redux/actions'

export const AccountSettings: React.FC = () => {
  const history = useHistory()
  const dispatch = useDispatch()

  const accountState = useSelector((state: StoreState) => state.auth.user)

  const [name, setName] = React.useState('')
  const [email, setEmail] = React.useState('')
  const [phoneNumber, setPhoneNumber] = React.useState('')
  const [disableButton, setDisableButton] = React.useState(false)

  React.useEffect(() => {
    if (
      (validateEmail(email) && email !== accountState?.email) ||
      (name !== accountState?.name && name !== '') ||
      (phoneNumber !== accountState?.phoneNumber && phoneNumber.length === 16)
    )
      setDisableButton(true)
    else setDisableButton(false)
  }, [name, email, phoneNumber])

  const onNameChange = (event: React.ChangeEvent<HTMLInputElement>) =>
    setName(event.target.value)

  const onEmailChange = (event: React.ChangeEvent<HTMLInputElement>) =>
    setEmail(event.target.value)

  const onPhoneNumberChange = (event: React.ChangeEvent<HTMLInputElement>) =>
    setPhoneNumber(event.target.value)

  const onEdit = () => {
    dispatch(updateAccount(accountState?.userId!, name, email, phoneNumber))
    history.push(AccountRoutes.home)
  }

  const onBackButton = () => {
    history.push(AccountRoutes.home)
  }

  return (
    <AccountSettingsView
      name={name}
      email={email}
      phoneNumber={phoneNumber}
      disableButton={disableButton}
      userName={accountState?.name}
      useEmail={accountState?.email}
      userPhoneNumber={accountState?.phoneNumber}
      onNameChange={onNameChange}
      onEmailChange={onEmailChange}
      onPhoneNumberChange={onPhoneNumberChange}
      onEdit={onEdit}
      onBackButton={onBackButton}
    />
  )
}
