import React from 'react'
import { Redirect, Route, RouteProps } from 'react-router-dom'
import { AuthenticationRoutes } from 'features/authentication/constants/routes'
import { useToken } from 'hooks/useToken'
import { validateToken } from 'features/authentication/utils'

export const ProtectedRoute: React.FC<RouteProps> = ({
  component,
  ...rest
}) => {
  const token = useToken()
  let tokenIsValid = validateToken(token!)

  const render = ((Component: any) => (routeProps: RouteProps) => {
    if (!tokenIsValid) return <Redirect to={AuthenticationRoutes.signIn} />

    return <Component {...routeProps} />
  })(component)

  return <Route {...rest} render={render} />
}
