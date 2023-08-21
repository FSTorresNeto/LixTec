import React, { ChangeEvent } from 'react'
import { useHistory } from 'react-router-dom'

import { useDispatch, useSelector } from 'react-redux'
import { RegisterUserView } from './RegisterUser.view'
import { OnboardingRoutes } from 'features/onboarding/constants/routes'
import { AuthenticationRoutes } from 'features/authentication/constants/routes'
import { validateEmail } from '_utils/validator/validate'
import { StoreState } from 'redux/state'
import { updateOnboardingForm } from 'features/onboarding/redux/actions'

export const RegisterUser = () => {
  const history = useHistory()
  const dispatch = useDispatch()

  const onboardingForm = useSelector(
    (state: StoreState) => state.onboarding.onboardingForm,
  )
  const [disableButton, setDisableButton] = React.useState(false)
  const [userName, setUseName] = React.useState('')
  const [phoneNumber, setPhoneNumber] = React.useState('')
  const [email, setEmail] = React.useState('')

  React.useEffect(() => {
    validateEmail(email) && userName !== undefined && phoneNumber.length !== 16
      ? setDisableButton(true)
      : setDisableButton(false)
  }, [phoneNumber, email, userName])

  const onUserNameChange = (event: ChangeEvent<HTMLInputElement>) => {
    setUseName(event.target.value)
  }

  const onPhoneNumberChange = (event: ChangeEvent<HTMLInputElement>) => {
    setPhoneNumber(event.target.value)
  }

  const onEmailChange = (event: ChangeEvent<HTMLInputElement>) => {
    setEmail(event.target.value)
  }

  const onBackButton = () => {
    history.push(AuthenticationRoutes.signIn)
  }

  const onMoveToCreatePassword = () => {
    dispatch(
      updateOnboardingForm({
        name: userName,
        mail: email,
        phoneNumber: phoneNumber,
      }),
    )
    history.push(OnboardingRoutes.registerPassword)
  }

  return (
    <RegisterUserView
      disableButton={disableButton}
      userName={userName}
      phoneNumber={phoneNumber}
      email={email}
      onUserNameChange={onUserNameChange}
      onPhoneNumberChange={onPhoneNumberChange}
      onEmailChange={onEmailChange}
      onBackButton={onBackButton}
      onMoveToCreatePassword={onMoveToCreatePassword}
    />
  )
}
