import React from 'react'
import { HomeView } from './Home.view'
import { CookiesProvider } from 'react-cookie'
import { useDispatch, useSelector } from 'react-redux'
import { useHistory } from 'react-router-dom'
import { AuthenticationRoutes } from 'features/authentication/constants/routes'
import { AccountRoutes } from 'features/account/constants/routes'
import { StoreState } from 'redux/state'

export const Home: React.FC = () => {
  const history = useHistory()
  const dispatch = useDispatch()

  const authState = useSelector((state: StoreState) => state.auth.user)

  const onSignOut = () => {
    /* dispatch(signOut()) */
    history.push(AuthenticationRoutes.signIn)
  }

  const onMoveToAccountSettings = () => {
    history.push(AccountRoutes.settings)
  }

  return (
    <CookiesProvider>
      <HomeView
        accountName={authState?.name}
        onSignOut={onSignOut}
        onMoveToAccountSettings={onMoveToAccountSettings}
      />
    </CookiesProvider>
  )
}
