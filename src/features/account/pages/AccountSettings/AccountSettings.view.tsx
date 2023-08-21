import React from 'react'
import { Box, Container, Typography } from '@material-ui/core'
import { useStyles } from './AccountSettings.styles'
import User from '../../../../_assets/icons/user.svg'
import { AccountForm } from 'features/account/components'
import { Button } from 'components'

interface IAccountSettingsProps {
  name: string
  email: string
  phoneNumber: string
  userName?: string
  useEmail?: string
  userPhoneNumber?: string
  disableButton: boolean
  onEdit: VoidFunction
  onBackButton: VoidFunction
  onNameChange: (event: any) => void
  onEmailChange: (event: any) => void
  onPhoneNumberChange: (event: any) => void
}

export const AccountSettingsView: React.FC<IAccountSettingsProps> = ({
  name,
  email,
  phoneNumber,
  userName,
  useEmail,
  userPhoneNumber,
  disableButton,
  onEdit,
  onBackButton,
  onNameChange,
  onEmailChange,
  onPhoneNumberChange,
}) => {
  const style = useStyles()

  return (
    <Container className={style.container}>
      <Box className={style.topHeader} />

      <Box>
        <img src={User} alt="" width="100" height="100" />
        <Typography>{userName}</Typography>
        <Typography>{useEmail}</Typography>
        <Typography>{userPhoneNumber}</Typography>
      </Box>

      <AccountForm
        name={name}
        email={email}
        phoneNumber={phoneNumber}
        onEmailChange={onEmailChange}
        onNameChange={onNameChange}
        onPhoneNumberChange={onPhoneNumberChange}
      />

      <Box className={style.pageFooter}>
        <Button className={style.button} onClick={onBackButton}>
          Voltar
        </Button>

        <Button
          onClick={onEdit}
          className={style.button}
          disabled={!disableButton}
        >
          Editar
        </Button>
      </Box>

      <Box className={style.bottomHeader} />
    </Container>
  )
}
