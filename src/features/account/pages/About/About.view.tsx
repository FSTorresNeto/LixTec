import React from 'react'
import { Box, Container, Divider } from '@material-ui/core'
import { useStyles } from './About.styles'
import { DescriptionProject } from 'features/account/components'
import { Button } from 'components'

interface IAboutProps {
  onBackButton: VoidFunction
}

export const AboutView: React.FC<IAboutProps> = ({ onBackButton }) => {
  const style = useStyles()
  return (
    <Container className={style.container}>
      <Box className={style.topHeader} />

      <DescriptionProject />

      <Divider variant="middle" className={style.divider} />

      <Box className={style.pageFooter}>
        <Button className={style.button} onClick={onBackButton}>
          Voltar
        </Button>
      </Box>
      <Box className={style.bottomHeader} />
    </Container>
  )
}
