import { FunctionComponent } from 'react'

import { useStyles } from './DepositsList.styles'
import { Box, Button, Typography } from '@material-ui/core'

interface IDepositsListProps {
  depositName?: string
  street?: string
  number?: string
}

export const DepositsList: FunctionComponent<IDepositsListProps> = ({
  depositName,
  street,
  number,
}) => {
  const style = useStyles()

  return (
    <Button className={style.button}>
      <Box className={style.title}>
        <Box className={style.title}>
          <Typography>{depositName ?? 'teste'}</Typography>
          <Typography>{street}</Typography>
          <Typography>{number}</Typography>
        </Box>
      </Box>
    </Button>
  )
}
