import { UpdateUserForm } from './models/updateUserForm'

export interface UpdateAccountDataState {
  user?: UpdateUserForm
  loading: boolean
  errorMessage?: string
}

export class InitialUpdateAccountDataState implements UpdateAccountDataState {
  loading: boolean = false
  errorMessage?: string

  constructor(public updateUserForm?: UpdateUserForm) {}
}

export class LoadingUpdateAccountDataState implements UpdateAccountDataState {
  loading: boolean = true
  errorMessage?: string

  constructor(public updateUserForm?: UpdateUserForm) {}
}

export class SuccessUpdateAccountDataState implements UpdateAccountDataState {
  loading: boolean = false
  errorMessage?: string

  constructor(public updateUserForm: UpdateUserForm | undefined) {}
}

export class FailUpdateAccountDataState implements UpdateAccountDataState {
  loading: boolean = false

  constructor(
    public errorMessage: string,
    public updateUserForm: UpdateUserForm | undefined,
  ) {}
}
