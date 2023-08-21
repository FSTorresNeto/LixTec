import { Box, Snackbar } from '@material-ui/core'
import { Alert as MuiAlert, AlertTitle } from '@material-ui/lab'
import React from 'react'

interface AlertProps {
  title: string
  message?: string | undefined
  autoHideDuration?: number
  severity?: 'success' | 'info' | 'warning' | 'error'
  onClose?: VoidFunction
}

export const Alert = ({
  title,
  message,
  severity,
  onClose,
  autoHideDuration = 3000,
  ...rest
}: AlertProps) => {
  const [isOpen, setIsOpen] = React.useState<boolean>(message !== undefined)
  const [onMessageError, setMessageError] = React.useState(true)

  const onClosePopUp = () => {
    setMessageError(false)
  }

  return (
    <Box>
      <Snackbar
        open={isOpen}
        autoHideDuration={autoHideDuration}
        onClose={() => {
          setIsOpen(false)
          onClose?.call(this)
        }}
        anchorOrigin={{ vertical: 'top', horizontal: 'center' }}
      >
        <MuiAlert severity={severity}>
          <AlertTitle>Ops...</AlertTitle>
          Ocorreu um erro inesperado
        </MuiAlert>
      </Snackbar>
    </Box>
  )
}
