import { FunctionComponent } from 'react'
import { useStyles } from './LinkRouter.styles'
import { Box, Link, Typography } from '@material-ui/core'

interface LinkRouterProps {
  title: string
  onClick: React.MouseEventHandler<HTMLButtonElement>
}

export const LinkRouter: FunctionComponent<LinkRouterProps> = ({
  title,
  onClick,
}) => {
  const style = useStyles()
  return (
    <Box>
      <Link href="#" underline="none">
        <Typography className={style.link} onClick={onClick}>
          {title}
        </Typography>
      </Link>
    </Box>
  )
}
