import { makeStyles } from '@material-ui/core'
import { colors } from '_config'

export const useStyles = makeStyles({
  container: {
    maxWidth: '440px !important',
    height: '100vh',
    display: 'flex',
    flexDirection: 'column',
    justifyContent: 'space-around',
    backgroundColor: colors.system.light.primary,
    alignItems: 'center',
  },
  header: {
    height: '80%',
    display: 'flex',
    alignItems: 'center',
    flexDirection: 'column',
    justifyContent: 'space-around',
  },
  title: {
    fontSize: '40px',
    color: colors.system.textColors.secondary,
  },
  forgotPassword: {
    display: 'flex',
    width: '100%',
    flexDirection: 'column',
  },
  inputTitle: {
    fontWeight: 600,
    fontSize: '16px',
    display: 'flex',
    color: colors.system.light.fontTitle,
  },
  textField: {
    maxWidth: '330px',
    borderRadius: '4px',
    display: 'flex',
    color: colors.system.light.secondary,
    minWidth: '248px',
    backgroundColor: colors.system.light.pure,
    '& .MuiOutlinedInput-notchedOutline': {
      borderColor: `${colors.system.systemColors.secondary}!important`,
    },
    '&:hover > .MuiOutlinedInput-notchedOutline': {
      borderColor: colors.system.systemColors.secondary,
    },
    '& label.Mui-focused': {
      color: colors.system.light.secondary,
    },
    '& .MuiInput-underline:after': {
      borderBottomColor: colors.system.light.secondary,
    },
    '& .MuiOutlinedInput-root': {
      '& fieldset': {
        borderColor: colors.system.light.secondary,
      },
      '&:hover fieldset': {
        borderColor: colors.system.light.secondary,
      },
      '&.Mui-focused fieldset': {
        borderColor: colors.system.light.secondary,
      },
    },
  },
  button: {
    width: '40%',
    fontWeight: 700,
    fontSize: '14px',
    borderRadius: '30px',
    color: colors.system.neutralColors.primary,
    backgroundColor: `${colors.system.light.tertiary}`,
    '&:hover': {
      backgroundColor: `${colors.system.light.tertiary}`,
    },
  },
})
