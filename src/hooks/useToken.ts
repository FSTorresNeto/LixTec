import { useSelector } from 'react-redux'
import { StoreState } from 'redux/state'

export const useToken = () => {
  return useSelector((state: StoreState) => state.auth.user?.jwtToken)
}
