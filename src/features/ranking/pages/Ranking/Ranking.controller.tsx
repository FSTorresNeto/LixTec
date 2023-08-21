import React from 'react'
import { useHistory } from 'react-router-dom'

import { RankingView } from './Ranking.view'
import { useSelector } from 'react-redux'
import { StoreState } from 'redux/state'
import { AccountRoutes } from 'features/account/constants/routes'

export const Ranking = () => {
  const history = useHistory()

  const deposits = useSelector(
    (state: StoreState) => state.auth.user?.depositsTotalValue,
  )

  const onBackButton = () => {
    history.push(AccountRoutes.home)
  }

  return <RankingView onBackButton={onBackButton} progress={deposits} />
}
