import { User } from './models/user'

export interface AuthState {
  user?: User
  token?: string
  loading: boolean
  errorMessage?: string
}

export class InitialAuthenticatedState implements AuthState {
  loading: boolean = false
  errorMessage?: string

  constructor(public user?: User) {}
}

export class LoadingAuthState implements AuthState {
  loading: boolean = true
  errorMessage?: string

  constructor(public user?: User) {}
}

export class SuccessAuthState implements AuthState {
  loading: boolean = false
  errorMessage?: string

  constructor(public user?: User, public token?: string) {}
}

export class FailAuthState implements AuthState {
  loading: boolean = false

  constructor(public errorMessage: string, public user: User | undefined) {}
}
