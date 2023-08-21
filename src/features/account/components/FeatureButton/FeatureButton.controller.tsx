import { useHistory } from 'react-router-dom'

import { FeatureButtonView } from './FeatureButton.view'
import { RankingRouter } from 'features/ranking/constants/routes'
import { DepositsRouter } from 'features/deposits/constants/routes'
import { AccountRoutes } from 'features/account/constants/routes'

export const FeatureButton = () => {
  const history = useHistory()

  const onMoveToAbout = () => {
    history.push(AccountRoutes.about)
  }

  const onMoveToListDepositPoints = () => {
    history.push(DepositsRouter.trashCanList)
  }

  const onMoveToQrCodeReader = () => {
    history.push(DepositsRouter.deposits)
  }

  const onMoveToRanking = () => {
    history.push(RankingRouter.ranking)
  }

  return (
    <FeatureButtonView
      onMoveToAbout={onMoveToAbout}
      onMoveToListDepositPoints={onMoveToListDepositPoints}
      onMoveToQrCodeReader={onMoveToQrCodeReader}
      onMoveToRanking={onMoveToRanking}
    />
  )
}
