import { makeStyles } from '@material-ui/core'
import { colors } from '_config'

export const useStyles = makeStyles({
  container: {
    maxWidth: '100%',
    height: '100vh',
    display: 'flex',
    flexDirection: 'column',
    justifyContent: 'space-around',
    backgroundColor: colors.system.backgroundColors.primary,
  },
  body: {
    height: '80%',
    display: 'flex',
    alignItems: 'center',
    flexDirection: 'column',
    justifyContent: 'space-evenly',
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
  title: { color: '#A7C957', fontSize: 20, textTransform: 'capitalize' },
  link: { color: '#F7863B', fontSize: 14, fontWeight: 500 },
  iconUser: { color: '#A7C957', alignItems: 'center', display: 'flex' },
  icon: { color: '#A7C957' },
  button: {
    fontWeight: 700,
    fontSize: '14px',
    borderRadius: '30px',
    color: colors.system.neutralColors.primary,
    backgroundColor: `${colors.system.backgroundColors.secondary} !important`,
  },
  user: {
    display: 'flex',
    marginTop: '10px',
    justifyContent: 'space-around',
  },
  userName: { alignItems: 'center', display: 'flex', color: '#000000' },
  appBar: {
    width: '100%',
    height: '100px',
    backgroundColor: colors.system.backgroundColors.secondary,
  },
  pageFooter: {
    display: 'flex',
    alignItems: 'center',
    width: '100%',
    justifyContent: 'space-between',
    marginTop: '10px',
  },
})
