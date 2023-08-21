import { makeStyles } from '@material-ui/core'
import { colors } from '_config'

export const useStyles = makeStyles({
  container: {
    padding: '0px',
  },
  header: {
    margin: '8px',
    padding: '8px',
    display: 'flex',
    alignItems: 'center',
    flexDirection: 'column',
  },
  title: {
    fontWeight: 600,
    fontSize: '117%',
    color: colors.system.systemColors.secondary,
  },
  textField: {
    marginTop: '34px',
    textAlign: 'justify',
  },
  checkbox: {
    color: colors.system.light.tertiary,
    '&.Mui-checked': {
      color: colors.system.light.tertiary,
    },
  },
  divider: {
    width: '100%',
    marginTop: '10px',
    borderColor: colors.system.systemColors.secondary,
  },
  pageFooter: {
    width: '100%',
    marginTop: '10px',
    display: 'flex',
    justifyContent: 'space-between',
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
