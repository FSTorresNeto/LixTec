import { useHistory } from 'react-router-dom'

import { ConcludeRegisterView } from './ConcludeRegister.view'
import { AuthenticationRoutes } from 'features/authentication/constants/routes'

export const ConcludeRegister = () => {
  const history = useHistory()

  const onConcludeRegister = () => {
    history.push(AuthenticationRoutes.signIn)
  }

  return <ConcludeRegisterView onConcludeRegister={onConcludeRegister} />
}
