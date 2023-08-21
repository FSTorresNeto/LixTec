import { Container, Box, Button } from '@material-ui/core'
import { useStyles } from './Welcome.styles'
import { PageTitle } from 'components'

interface IWelcomeViewProps {
  onMoveToSignIn?: VoidFunction
}

export const WelcomeView: React.FC<IWelcomeViewProps> = ({
  onMoveToSignIn,
}) => {
  const style = useStyles()

  return (
    <Container className={style.container}>
      <Box className={style.header}>
        <PageTitle title="Bem vindo" />

        <Button className={style.button} onClick={onMoveToSignIn}>
          Entrar
        </Button>
      </Box>
    </Container>
  )
}
