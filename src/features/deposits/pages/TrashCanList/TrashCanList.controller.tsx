import React from 'react'
import { TrashCanListView } from './TrashCanList.view'
import { CookiesProvider } from 'react-cookie'
import { useHistory } from 'react-router-dom'
import { useDispatch, useSelector } from 'react-redux'
import { StoreState } from 'redux/state'
import { AccountRoutes } from 'features/account/constants/routes'
import { trashList } from 'features/deposits/redux/actions'

export const TrashCanList: React.FC = () => {
  const history = useHistory()
  const dispatch = useDispatch()

  React.useEffect(() => {
    dispatch(trashList())
  }, [])

  const onBackButton = () => {
    history.push(AccountRoutes.home)
  }
  return (
    <CookiesProvider>
      <TrashCanListView onBackButton={onBackButton} />
    </CookiesProvider>
  )
}
