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
    color: colors.system.textColors.secondary,
  },
  pageFooter: {
    width: '100%',
    display: 'flex',
    alignItems: 'center',
    justifyContent: 'center',
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
