import { OnboardingForm } from './models/onboardingForm'

export interface OnboardingState {
  onboardingForm?: OnboardingForm
  errorMessage?: string
  loading: boolean
}

export class InitialOnboardingState implements OnboardingState {
  loading: boolean = false
  errorMessage?: string

  constructor(public onboardingForm?: OnboardingForm) {}
}

export class LoadingOnboardingState implements OnboardingState {
  loading: boolean = true
  errorMessage?: string

  constructor(public onboardingForm?: OnboardingForm) {}
}

export class SuccessOnboardingState implements OnboardingState {
  loading: boolean = false
  errorMessage?: string

  constructor(public onboardingForm?: OnboardingForm) {}
}

export class FailOnboardingState implements OnboardingState {
  loading: boolean = false

  constructor(
    public errorMessage: string,
    public onboardingForm?: OnboardingForm,
  ) {}
}
