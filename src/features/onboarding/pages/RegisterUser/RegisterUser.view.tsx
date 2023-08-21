import {
  Container,
  Box,
  Typography,
  TextField,
  Button,
} from '@material-ui/core'
import { useStyles } from './RegisterUser.styles'
import { PageTitle } from 'components'

interface IRegisterUserViewProps {
  disableButton: boolean
  userName: string
  phoneNumber: string
  email: string
  onUserNameChange: (event: any) => void
  onPhoneNumberChange: (event: any) => void
  onEmailChange: (event: any) => void
  onBackButton: VoidFunction
  onMoveToCreatePassword: VoidFunction
}

export const RegisterUserView: React.FC<IRegisterUserViewProps> = ({
  disableButton,
  userName,
  phoneNumber,
  email,
  onUserNameChange,
  onPhoneNumberChange,
  onEmailChange,
  onBackButton,
  onMoveToCreatePassword,
}) => {
  const style = useStyles()
  const maskPhone = (value: string) => {
    if (!value) return ''

    return value
      .replace(/\D/g, '')
      .replace(/(\d{2})(\d{1})(\d)/, '($1) $2 $3')
      .replace(/(\d{4})(\d{4})/, '$1-$2')
      .replace(/(.\d{4})(-)(\d{4})\d+?$/, '$1$2$3')
  }

  return (
    <Container className={style.container}>
      <Box className={style.header}>
        <PageTitle title="Faça seu cadastro!" />

        <Box>
          <Typography className={style.inputTitle}>{'Nome:'}</Typography>
          <TextField
            variant="outlined"
            className={style.textField}
            onChange={onUserNameChange}
            value={userName}
          />
        </Box>

        <Box>
          <Typography className={style.inputTitle}>
            {'Número do celular:'}
          </Typography>
          <TextField
            variant="outlined"
            className={style.textField}
            onChange={onPhoneNumberChange}
            value={maskPhone(phoneNumber)}
          />
        </Box>

        <Box>
          <Typography className={style.inputTitle}>{'Email:'}</Typography>
          <TextField
            variant="outlined"
            className={style.textField}
            onChange={onEmailChange}
            value={email}
          />
        </Box>
      </Box>
      <Box className={style.footerButtons}>
        <Button className={style.button} onClick={onBackButton}>
          Voltar
        </Button>

        <Button
          className={style.button}
          disabled={!disableButton}
          onClick={onMoveToCreatePassword}
        >
          Próximo
        </Button>
      </Box>
    </Container>
  )
}
