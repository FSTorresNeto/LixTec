import { useHistory } from 'react-router-dom'
import { WelcomeView } from './Welcome.view'
import { AuthenticationRoutes } from 'features/authentication/constants/routes'

export const Welcome = () => {
  const history = useHistory()

  const onMoveToSignIn = () => {
    history.push(AuthenticationRoutes.signIn)
  }

  return <WelcomeView onMoveToSignIn={onMoveToSignIn} />
}
