import { FunctionComponent } from 'react'

import User from '../../../../_assets/icons/user.svg'
import { useStyles } from './Header.styles'
import { Box, Typography } from '@material-ui/core'

interface IHeaderProps {
  userName?: string
  onClick?: React.MouseEventHandler
}

export const Header: FunctionComponent<IHeaderProps> = ({
  onClick,
  userName,
}) => {
  const style = useStyles()
  return (
    <Box>
      <Box className={style.welcomeTitle}>
        <Typography className={style.userName}>
          {userName ?? 'Houve um erro inesperado'}
        </Typography>
        <img src={User} alt="" width="100" height="50" onClick={onClick} />
      </Box>
    </Box>
  )
}
