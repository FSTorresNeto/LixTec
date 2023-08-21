import { AuthenticationRoutes } from 'features/authentication/constants/routes'
import { OnboardingRoutes } from '../../features/onboarding/constants/routes'
import {
  ConcludeRegister,
  RegisterPassword,
  RegisterUser,
  Terms,
  Welcome,
} from '../../features/onboarding/pages'
import { BrowserRouter, Route, Switch } from 'react-router-dom'
import { SignIn } from 'features/authentication/pages'
import { AccountRoutes } from 'features/account/constants/routes'
import { About, AccountSettings, Home } from 'features/account'
import { RankingRouter } from 'features/ranking/constants/routes'
import { Ranking } from 'features/ranking/pages'
import { DepositsRouter } from 'features/deposits/constants/routes'
import { ScanQrCode, SelectOption, TrashCanList } from 'features/deposits'
import { ProtectedRoute } from 'components/ProtectedRoute'

export const Router: React.FC = () => {
  return (
    <BrowserRouter>
      <Switch>
        <Route exact path={OnboardingRoutes.welcome} component={Welcome} />
        <Route exact path={OnboardingRoutes.terms} component={Terms} />
        <Route
          exact
          path={OnboardingRoutes.registerUser}
          component={RegisterUser}
        />
        <Route
          exact
          path={OnboardingRoutes.registerPassword}
          component={RegisterPassword}
        />
        <Route
          exact
          path={OnboardingRoutes.concludeRegister}
          component={ConcludeRegister}
        />

        <Route exact path={AuthenticationRoutes.signIn} component={SignIn} />

        <ProtectedRoute exact path={AccountRoutes.home} component={Home} />
        <ProtectedRoute
          exact
          path={AccountRoutes.settings}
          component={AccountSettings}
        />
        <ProtectedRoute exact path={AccountRoutes.about} component={About} />

        <ProtectedRoute
          exact
          path={RankingRouter.ranking}
          component={Ranking}
        />

        <ProtectedRoute
          exact
          path={DepositsRouter.selectOption}
          component={SelectOption}
        />
        <ProtectedRoute
          exact
          path={DepositsRouter.trashCanList}
          component={TrashCanList}
        />
        <ProtectedRoute
          exact
          path={DepositsRouter.deposits}
          component={ScanQrCode}
        />
      </Switch>
    </BrowserRouter>
  )
}
