import React from 'react'
import QrReader from 'react-qr-reader'

interface IQrCodeReaderProps {
  onScanFail: (_?: any) => void
  onScanComplete: (_: string | null) => void
}

export const QrCodeReader: React.FC<IQrCodeReaderProps> = ({
  onScanFail,
  onScanComplete,
}) => {
  return <QrReader delay={1000} onScan={onScanComplete} onError={onScanFail} />
}
