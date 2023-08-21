import { Box, Button, Container } from '@material-ui/core'
import { Title } from '../../../../components'
import { useStyles } from './ConcludeRegister.styles'

interface IConcludeRegisterViewProps {
  onConcludeRegister: VoidFunction
}

export const ConcludeRegisterView: React.FC<IConcludeRegisterViewProps> = ({
  onConcludeRegister,
}) => {
  const style = useStyles()
  return (
    <Container className={style.container}>
      <Box className={style.header}>
        <Title title="Cadastro concluído" />

        <Button className={style.button} onClick={onConcludeRegister}>
          Concluir
        </Button>
      </Box>
    </Container>
  )
}
