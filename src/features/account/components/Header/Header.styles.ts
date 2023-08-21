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
    height: '100%',
    display: 'grid',
    rowGap: '1%',
    columnGap: '2%',
    justifyItems: 'center',
    alignContent: 'center',
    justifyContent: 'center',
    gridTemplateColumns: '1fr 1fr',
  },
  title: {
    color: colors.system.textColors.primary,
    fontSize: 20,
    textTransform: 'capitalize',
  },
  icon: {
    color: colors.system.backgroundColors.primary,
  },
  button: {
    minWidth: '120px',
    minHeight: '120px',
    backgroundColor: colors.system.backgroundColors.secondary,
    display: 'grid',
    justifyItems: 'center',
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
  welcomeTitle: {
    display: 'flex',
    color: colors.system.light.primary,
    justifyContent: 'space-between',
    marginTop: '50px',
  },
  link: {
    fontWeight: 500,
    fontSize: '14px',
    color: colors.system.systemColors.secondary,
  },
  signOut: {
    display: 'flex',
    justifyContent: 'center',
  },
  signOutButton: {
    width: '100%',
    fontWeight: 700,
    fontSize: '14px',
    borderRadius: '30px',
    color: colors.system.neutralColors.primary,
    backgroundColor: `${colors.system.backgroundColors.secondary} !important`,
  },
})
