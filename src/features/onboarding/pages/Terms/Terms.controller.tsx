import React from 'react'
import { useHistory } from 'react-router-dom'
import { useDispatch, useSelector } from 'react-redux'
import { TermsView } from './Terms.view'
import { AuthenticationRoutes } from 'features/authentication/constants/routes'
import { OnboardingRoutes } from 'features/onboarding/constants/routes'
import { StoreState } from 'redux/state'
import { createAccount } from 'features/onboarding/redux/actions'

export const Terms = () => {
  const dispatch = useDispatch()
  const history = useHistory()

  const onboardingState = useSelector(
    (state: StoreState) => state.onboarding.onboardingForm,
  )
  const [acceptTerms, setAcceptTerms] = React.useState(false)

  const onAcceptTerms = () => {
    acceptTerms === false ? setAcceptTerms(true) : setAcceptTerms(false)
  }

  const onMoveToConclude = () => {
    dispatch(
      createAccount(
        onboardingState?.mail!,
        onboardingState?.name!,
        onboardingState?.password!,
        onboardingState?.phoneNumber!,
        true,
      ),
    )
    history.push(OnboardingRoutes.concludeRegister)
  }
  const onRefuseTerms = () => {
    history.push(AuthenticationRoutes.signIn)
  }

  return (
    <TermsView
      acceptTerms={acceptTerms}
      onAcceptTerms={onAcceptTerms}
      onRefuseTerms={onRefuseTerms}
      onMoveToConclude={onMoveToConclude}
    />
  )
}
