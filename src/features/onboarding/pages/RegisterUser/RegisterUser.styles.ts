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
  },
  header: {
    height: '80%',
    display: 'flex',
    alignItems: 'center',
    flexDirection: 'column',
    justifyContent: 'space-around',
  },
  title: {
    fontSize: '170%',
    textAlign: 'center',
    color: colors.system.textColors.secondary,
  },
  inputTitle: {
    fontWeight: 600,
    fontSize: '16px',
    display: 'flex',
    color: colors.system.textColors.secondary,
  },
  textField: {
    borderRadius: '4px',
    display: 'flex',
    color: colors.system.systemColors.secondary,
    '& label.Mui-focused': {
      color: colors.system.systemColors.secondary,
    },
    '& .MuiInput-underline:after': {
      borderBottomColor: colors.system.systemColors.secondary,
    },
    '& .MuiOutlinedInput-root': {
      '& fieldset': {
        borderColor: colors.system.systemColors.secondary,
      },
      '&:hover fieldset': {
        borderColor: colors.system.systemColors.secondary,
      },
      '&.Mui-focused fieldset': {
        borderColor: colors.system.systemColors.secondary,
      },
    },
  },
  footerButtons: {
    display: 'flex',
    justifyContent: 'space-between',
    alignItems: 'center',
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
