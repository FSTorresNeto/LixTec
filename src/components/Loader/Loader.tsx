import React from 'react'
import { CircularProgress } from '@material-ui/core'
import { Backdrop } from '@material-ui/core'
import { makeStyles } from '@material-ui/core/styles'

const useStyles = makeStyles(theme => ({
  backdrop: {
    zIndex: theme.zIndex.drawer + 1,
    color: '#fff',
  },
}))

interface LoaderProps {
  open: boolean
}

export const Loader: React.FC<LoaderProps> = ({ open }: LoaderProps) => {
  const classes = useStyles()
  return (
    <Backdrop className={classes.backdrop} open={open}>
      <CircularProgress color="inherit" data-test-id="loader" />
    </Backdrop>
  )
}
