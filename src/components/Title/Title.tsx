import { FunctionComponent } from 'react'

import { useStyles } from './Title.styles'
import { Typography } from '@material-ui/core'

interface TitleProps {
  title: string
}

export const Title: FunctionComponent<TitleProps> = ({ title }) => {
  const style = useStyles()
  return <Typography className={style.title}>{title}</Typography>
}
