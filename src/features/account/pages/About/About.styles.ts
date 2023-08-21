import { makeStyles } from '@material-ui/core'
import { colors } from '_config'

export const useStyles = makeStyles({
  container: {
    maxWidth: '440px !important',
    height: '100vh',
    display: 'flex',
    flexDirection: 'column',
    justifyContent: 'space-around',
    alignItems: 'center',
    overflow: 'hidden',
    backgroundColor: colors.system.light.primary,
  },
  topHeader: {
    width: '440px',
    backgroundColor: colors.system.backgroundColors.secondary,
  },
  bottomHeader: {
    width: '440px',
    backgroundColor: colors.system.backgroundColors.secondary,
  },
  header: {
    height: '80%',
    display: 'flex',
    alignItems: 'center',
    flexDirection: 'column',
    justifyContent: 'space-around',
    margin: '16px',
  },
  divider: {
    marginTop: 4,
    borderColor: colors.system.systemColors.secondary,
    width: '100%',
  },
  pageFooter: {
    display: 'flex',
    alignItems: 'center',
    width: '100%',
    justifyContent: 'center',
    marginBottom: '10px',
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
