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
  user: {
    display: 'flex',
    marginTop: '10px',
    justifyContent: 'space-around',
  },
  userName: { alignItems: 'center', display: 'flex', color: '#000000' },
  appBar: {
    width: '100%',
  },
  topHeader: {
    width: '440px',
    display: 'list-item',
    backgroundColor: colors.system.backgroundColors.secondary,
  },
  bottomHeader: {
    width: '440px',
    display: 'list-item',
    backgroundColor: colors.system.backgroundColors.secondary,
  },
  welcomeTitle: {
    display: 'flex',
    color: colors.system.textColors.primary,
    justifyContent: 'center',
    lineHeight: '2.5',
    fontWeight: 700,
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
    fontSize: '14px',
    display: 'flex',
    justifyContent: 'center',
    marginBottom: '10px',
  },
})
