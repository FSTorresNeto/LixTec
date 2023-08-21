import React from 'react'
import { Box, Container, Typography } from '@material-ui/core'
import { useStyles } from './ScanQrCode.styles'
import { QrCodeReader } from 'features/deposits/components'
import { Button } from 'components'

interface IScanQrCodeProps {
  onBackButton: VoidFunction
  handleError: (e: string | null) => void
  handleScan: (e: string | null) => void
}

export const ScanQrCodeView: React.FC<IScanQrCodeProps> = ({
  onBackButton,
  handleError,
  handleScan,
}) => {
  const style = useStyles()
  return (
    <Container className={style.container}>
      <Box className={style.topHeader}></Box>

      <Box className={style.camera} data-test-id="camera">
        <Typography className={style.inputTitle}>Leia o QrCode</Typography>
      </Box>

      <QrCodeReader onScanFail={handleError} onScanComplete={handleScan} />

      <Box className={style.signOut}>
        <Button className={style.button} onClick={onBackButton}>
          Voltar
        </Button>
      </Box>
      <Box className={style.bottomHeader}></Box>
    </Container>
  )
}
