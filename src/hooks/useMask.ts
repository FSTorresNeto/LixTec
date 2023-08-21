import React from 'react'

export type ApplyMask = (pureValue: string) => string

export const useMask = (
  applyMask: ApplyMask,
  initialValue: string = '',
): [maskedValue: string, setMaskedValue: (value: string) => void] => {
  const [maskedValue, setMaskedValue] = React.useState(applyMask(initialValue))

  const _setMaskedValue = (value: string) => {
    setMaskedValue(applyMask(value))
  }

  return [maskedValue, _setMaskedValue]
}
