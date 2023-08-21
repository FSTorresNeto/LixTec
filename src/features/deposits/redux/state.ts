import { User } from 'features/authentication/redux/models/user'
import { Deposit } from './models/Deposit'
import { TrashList } from './models/TrashList'

export interface DepositState {
  deposit?: Deposit
  trashList?: TrashList[]
  loading: boolean
  success?: boolean
  errorMessage?: string
}

export class InitialDepositState implements DepositState {
  errorMessage?: string
  loading: boolean = false

  constructor(public deposit?: Deposit, public trashList?: TrashList[]) {}
}

export class LoadingDepositState implements DepositState {
  loading: boolean = true
  errorMessage?: string | undefined

  constructor(public deposit?: Deposit, public trashList?: TrashList[]) {}
}

export class SuccessDepositState implements DepositState {
  loading: boolean = false
  errorMessage?: string

  constructor(public trashList?: TrashList[]) {}
}

export class FailDepositState implements DepositState {
  loading: boolean = false

  constructor(
    public errorMessage: string,
    public deposit?: Deposit,
    public trashList?: TrashList[],
  ) {}
}
