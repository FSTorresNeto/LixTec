import { FunctionComponent } from 'react'

import { useStyles } from './PageTitle.styles'
import { Typography } from '@material-ui/core'

interface TitleProps {
  title: string
}

export const PageTitle: FunctionComponent<TitleProps> = ({ title }) => {
  const style = useStyles()
  return <Typography className={style.title}>{title}</Typography>
}
