import React from 'react'
import { SignInView } from './SignIn.view'
import { CookiesProvider } from 'react-cookie'
import { useDispatch, useSelector } from 'react-redux'
import { useHistory } from 'react-router-dom'
import { validateEmail } from '_utils/validator/validate'
import { login } from 'features/authentication/redux/actions'
import { OnboardingRoutes } from 'features/onboarding/constants/routes'
import { StoreState } from 'redux/state'
import { AccountRoutes } from 'features/account/constants/routes'
import { SuccessAuthState } from 'features/authentication/redux/state'

export const SignIn: React.FC = () => {
  const history = useHistory()
  const dispatch = useDispatch()

  const [email, setEmail] = React.useState('')
  const [password, setPassword] = React.useState('')
  const [disableButton, setDisableButton] = React.useState(true)
  const [showPassword, setShowPassword] = React.useState(false)

  const authState = useSelector((state: StoreState) => state.auth)

  React.useEffect(() => {
    validateEmail(email) && password.length >= 8
      ? setDisableButton(true)
      : setDisableButton(false)
  }, [password, email])

  React.useEffect(() => {
    if (authState instanceof SuccessAuthState) history.push(AccountRoutes.home)
  }, [authState.user?.jwtToken])

  const handleClickShowPassword = () => setShowPassword(show => !show)

  const handleMouseDownPassword = (
    event: React.MouseEvent<HTMLButtonElement>,
  ) => {
    event.preventDefault()
  }

  const onEmailChange = (event: React.ChangeEvent<HTMLInputElement>) =>
    setEmail(event.target.value)

  const onPasswordChange = (event: React.ChangeEvent<HTMLInputElement>) =>
    setPassword(event.target.value)

  const onMoveToCreateAccount = () => {
    history.push(OnboardingRoutes.registerUser)
  }

  const onSingIn = () => {
    dispatch(login(email, password))
  }

  return (
    <CookiesProvider>
      <SignInView
        email={email}
        password={password}
        disableButton={disableButton}
        loading={authState.loading}
        errorMessage={authState?.errorMessage}
        showPassword={showPassword}
        onEmailChange={onEmailChange}
        onPasswordChange={onPasswordChange}
        handleClickShowPassword={handleClickShowPassword}
        handleMouseDownPassword={handleMouseDownPassword}
        onMoveToCreateAccount={onMoveToCreateAccount}
        onSingIn={onSingIn}
      />
    </CookiesProvider>
  )
}
