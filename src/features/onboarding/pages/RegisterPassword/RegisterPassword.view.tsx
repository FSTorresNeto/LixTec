import { useStyles } from './RegisterPassword.styles'

import {
  Box,
  Button,
  Container,
  IconButton,
  InputAdornment,
  OutlinedInput,
  Typography,
} from '@material-ui/core'
import { VisibilityOff, Visibility } from '@material-ui/icons'
import { Title } from 'components'

interface IRegisterPasswordViewProps {
  disableButton: boolean
  onGoBack: VoidFunction
  onMoveToAcceptTerms: VoidFunction
  password: string
  rePassword: string
  showPassword: boolean
  showRePassword: boolean
  onPassword: (event: any) => void
  onRePassword: (event: any) => void
  handleClickShowPassword: (event: any) => void
  handleMouseDownPassword: (event: any) => void
  handleClickShowRePassword: (event: any) => void
  handleMouseDownRePassword: (event: any) => void
}

export const RegisterPasswordView: React.FC<IRegisterPasswordViewProps> = ({
  onGoBack,
  onMoveToAcceptTerms,
  disableButton,
  password,
  rePassword,
  onPassword,
  showPassword,
  showRePassword,
  onRePassword,
  handleClickShowPassword,
  handleMouseDownPassword,
  handleClickShowRePassword,
  handleMouseDownRePassword,
}) => {
  const style = useStyles()
  return (
    <Container className={style.container}>
      <Box className={style.header}>
        <Title title="Faça seu cadastro!" />
        <Box>
          <Typography className={style.inputTitle}>
            {'Digite sua senha:'}
          </Typography>
          <OutlinedInput
            type={showPassword ? 'text' : 'password'}
            className={style.textField}
            onChange={onPassword}
            value={password}
            endAdornment={
              <InputAdornment position="end">
                <IconButton
                  aria-label="toggle password visibility"
                  onClick={handleClickShowPassword}
                  onMouseDown={handleMouseDownPassword}
                  edge="end"
                >
                  {showPassword ? <VisibilityOff /> : <Visibility />}
                </IconButton>
              </InputAdornment>
            }
          />
        </Box>
        <Box>
          <Typography className={style.inputTitle}>
            {'Confirme sua senha:'}
          </Typography>
          <OutlinedInput
            type={showRePassword ? 'text' : 'password'}
            className={style.textField}
            onChange={onRePassword}
            value={rePassword}
            endAdornment={
              <InputAdornment position="end">
                <IconButton
                  aria-label="toggle password visibility"
                  onClick={handleClickShowRePassword}
                  onMouseDown={handleMouseDownRePassword}
                  edge="end"
                >
                  {showRePassword ? <VisibilityOff /> : <Visibility />}
                </IconButton>
              </InputAdornment>
            }
          />
        </Box>
      </Box>
      <Box className={style.footerButtons}>
        <Button className={style.button} onClick={onGoBack}>
          Voltar
        </Button>
        <Button
          className={style.button}
          disabled={disableButton}
          onClick={onMoveToAcceptTerms}
        >
          Finalizar
        </Button>
      </Box>
    </Container>
  )
}
