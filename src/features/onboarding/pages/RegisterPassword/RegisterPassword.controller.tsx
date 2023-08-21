import React, { ChangeEvent, useCallback } from 'react'
import { useHistory } from 'react-router-dom'

import { RegisterPasswordView } from './RegisterPassword.view'
import { OnboardingRoutes } from 'features/onboarding/constants/routes'
import { updateOnboardingForm } from 'features/onboarding/redux/actions'
import { useDispatch, useSelector } from 'react-redux'
import { StoreState } from 'redux/state'

export const RegisterPassword = () => {
  const history = useHistory()
  const dispatch = useDispatch()

  const onboarding = useSelector(
    (state: StoreState) => state.onboarding.onboardingForm,
  )

  const [disableButton, setDisableButton] = React.useState(false)
  const [password, setPassword] = React.useState('')
  const [rePassword, setRePassword] = React.useState('')
  const [showPassword, setShowPassword] = React.useState(false)
  const [showRePassword, setShowRePassword] = React.useState(false)

  React.useEffect(() => {
    password.length >= 8 && rePassword === password
      ? setDisableButton(false)
      : setDisableButton(true)
  }, [password, rePassword])

  const handleClickShowPassword = () => setShowPassword(show => !show)
  const handleClickShowRePassword = () => setShowRePassword(show => !show)

  const onGoBack = () => {
    history.push(OnboardingRoutes.registerUser)
  }

  const onMoveToAcceptTerms = () => {
    dispatch(
      updateOnboardingForm({
        ...onboarding,
        password: password,
      }),
    )
    history.push(OnboardingRoutes.terms)
  }

  const onPassword = (event: ChangeEvent<HTMLInputElement>) => {
    setPassword(event.target.value)
  }

  const onRePassword = (event: ChangeEvent<HTMLInputElement>) => {
    setRePassword(event.target.value)
  }

  const handleMouseDownPassword = (
    event: React.MouseEvent<HTMLButtonElement>,
  ) => {
    event.preventDefault()
  }

  const handleMouseDownRePassword = (
    event: React.MouseEvent<HTMLButtonElement>,
  ) => {
    event.preventDefault()
  }

  return (
    <RegisterPasswordView
      onGoBack={onGoBack}
      onMoveToAcceptTerms={onMoveToAcceptTerms}
      password={password}
      rePassword={rePassword}
      onPassword={onPassword}
      onRePassword={onRePassword}
      disableButton={disableButton}
      showPassword={showPassword}
      showRePassword={showRePassword}
      handleClickShowPassword={handleClickShowPassword}
      handleMouseDownPassword={handleMouseDownPassword}
      handleClickShowRePassword={handleClickShowRePassword}
      handleMouseDownRePassword={handleMouseDownRePassword}
    />
  )
}
