/* eslint-disable react-hooks/exhaustive-deps */
import React from 'react'
import { useStyles } from './Home.styles'
import { Container, Box } from '@material-ui/core'
import { Button } from 'components'
import { FeatureButton, Header } from 'features/account/components'

interface IHomeProps {
  accountName?: string
  onSignOut: VoidFunction
  onMoveToAccountSettings: VoidFunction
}

export const HomeView: React.FC<IHomeProps> = ({
  accountName,
  onSignOut,
  onMoveToAccountSettings,
}) => {
  const style = useStyles()

  return (
    <Container className={style.container}>
      <Box className={style.topHeader} />
      <Box className={style.appBar}>
        <Header onClick={onMoveToAccountSettings} userName={accountName} />
      </Box>

      <FeatureButton />

      <Box className={style.signOutButton}>
        <Button className={style.button} onClick={onSignOut}>
          Sair
        </Button>
      </Box>

      <Box className={style.bottomHeader} />
    </Container>
  )
}
