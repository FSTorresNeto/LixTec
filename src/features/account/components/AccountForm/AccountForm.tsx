import { FunctionComponent } from 'react'

import { useStyles } from './AccountForm.styles'
import { Box, TextField } from '@material-ui/core'
import { maskPhone } from '_utils/masks/phone'

interface IAccountFormProps {
  name: string
  email?: string
  phoneNumber?: string
  onNameChange: (event: any) => void
  onEmailChange: (event: any) => void
  onPhoneNumberChange: (event: any) => void
}

export const AccountForm: FunctionComponent<IAccountFormProps> = ({
  name,
  email,
  phoneNumber,
  onNameChange,
  onEmailChange,
  onPhoneNumberChange,
}) => {
  const style = useStyles()

  return (
    <Box className={style.body}>
      <Box>
        <TextField
          id="standard-basic"
          placeholder="Seu Nome" // TODO: colocar valor do estado da conta
          onChange={onNameChange}
          value={name}
          label="Nome:"
          variant="standard"
          aria-readonly
          className={style.userName}
        />
      </Box>

      <Box>
        <TextField
          id="standard-basic"
          onChange={onEmailChange}
          placeholder="Seu Email" // TODO: colocar valor do estado da conta
          value={email}
          label="Email:"
          variant="standard"
          aria-readonly
          className={style.userName}
        />
      </Box>

      <Box>
        <TextField
          id="standard-basic"
          onChange={onPhoneNumberChange}
          placeholder="Seu numero" // TODO: colocar valor do estado da conta
          value={maskPhone(phoneNumber!)}
          label="Número de celular:"
          variant="standard"
          aria-readonly
          className={style.userName}
        />
      </Box>
    </Box>
  )
}
