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
    alignContent: 'center',
  },
  title: {
    color: colors.system.textColors.primary,
    fontSize: 20,
    textTransform: 'none',
  },
  icon: {
    color: colors.system.backgroundColors.primary,
  },
  button: {
    minWidth: '120px',
    minHeight: '120px',
    backgroundColor: colors.system.backgroundColors.secondary,
    display: 'grid',
    justifyContent: 'space-around',
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
    color: colors.system.textColors.tertiary,
    justifyContent: 'center',
  },
  link: {
    fontWeight: 500,
    fontSize: '14px',
    color: colors.system.systemColors.secondary,
  },
  signOut: {
    display: 'flex',
    alignItems: 'center',
    width: '100%',
    justifyContent: 'center',
    marginBottom: '10px',
  },
  signOutButton: {
    width: '100%',
    fontWeight: 700,
    fontSize: '14px',
    borderRadius: '30px',
    color: colors.system.neutralColors.primary,
    backgroundColor: `${colors.system.backgroundColors.secondary} !important`,
  },
  street: {},
  trashCanInfo: { display: 'flex' },
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
  inputTitle: {
    fontSize: '20px',
    fontWeight: 600,
    display: 'flex',
    marginTop: '10px',
    marginBottom: '10px',
    justifyContent: 'center',
    color: colors.system.textColors.secondary,
  },

  inputSubTitle: {
    fontSize: '16px',
    fontWeight: 600,
    display: 'flex',
    justifyContent: 'center',
    color: colors.system.textColors.secondary,
  },

  textField: {
    marginTop: '4px',
    textAlign: 'justify',
  },
})
