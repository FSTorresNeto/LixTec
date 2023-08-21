import React from 'react'

export type ApplyMask = (pureValue: string) => string

export const useValue = (
  applyMask: ApplyMask,
  initialValue: string = '0',
): [maskedValue: string, setMaskedValue: (value: string) => void] => {
  const [maskedValue, setMaskedValue] = React.useState(applyMask(initialValue))

  const _setMaskedValue = (value: string) => {
    setMaskedValue(applyMask(value))
  }

  return [maskedValue, _setMaskedValue]
}
