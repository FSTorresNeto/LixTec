/* eslint-disable react-hooks/exhaustive-deps */
import React from 'react'
import {
  Container,
  Box,
  IconButton,
  InputAdornment,
  OutlinedInput,
  TextField,
  Typography,
} from '@material-ui/core'
import { useStyles } from './SignIn.styles'
import { VisibilityOff, Visibility } from '@material-ui/icons'
import { Alert, Button, LinkRouter, Loader, PageTitle } from 'components'

interface ISignInProps {
  email: string
  password: string
  disableButton: boolean
  loading: boolean
  errorMessage?: string
  showPassword: boolean
  onEmailChange: (event: any) => void
  onPasswordChange: (event: any) => void
  handleClickShowPassword: (event: any) => void
  handleMouseDownPassword: (event: any) => void
  onMoveToCreateAccount: VoidFunction
  onSingIn: VoidFunction
}

export const SignInView: React.FC<ISignInProps> = ({
  email,
  password,
  disableButton,
  loading,
  errorMessage,
  showPassword,
  onEmailChange,
  onPasswordChange,
  handleClickShowPassword,
  handleMouseDownPassword,
  onMoveToCreateAccount,
  onSingIn,
}) => {
  const style = useStyles()

  return (
    <Container className={style.container}>
      <Box className={style.header}>
        <PageTitle title="Faça Login!" />

        <Box>
          <Typography className={style.inputTitle}>{'Email:'}</Typography>
          <TextField
            className={style.textField}
            variant="outlined"
            onChange={onEmailChange}
            value={email}
          />
        </Box>

        <Box>
          <Typography className={style.inputTitle}>{'Senha:'}</Typography>
          <OutlinedInput
            type={showPassword ? 'text' : 'password'}
            className={style.textField}
            onChange={onPasswordChange}
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

        <Button
          className={style.button}
          disabled={!disableButton}
          onClick={onSingIn}
        >
          Entrar
        </Button>

        <LinkRouter
          title=" Não tem conta ? Cadastre-se já!"
          onClick={onMoveToCreateAccount}
        />

        {errorMessage && (
          <Alert
            title="Aviso!"
            message="Sua sessão expirou."
            severity={'error'}
          />
        )}
        <Loader open={loading} />
      </Box>
    </Container>
  )
}
