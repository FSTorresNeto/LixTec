import { makeStyles } from '@material-ui/core'
import { colors } from '_config'

export const useStyles = makeStyles({
  container: {
    maxWidth: '440px !important',
    height: '100vh',
    display: 'flex',
    flexDirection: 'column',
    justifyContent: 'space-between',
    alignItems: 'center',
    overflow: 'hidden',
    backgroundColor: colors.system.light.primary,
  },
  topHeader: {
    display: 'list-item',
    width: '440px',
    backgroundColor: colors.system.backgroundColors.secondary,
  },
  bottomHeader: {
    display: 'list-item',
    width: '440px',
    backgroundColor: colors.system.backgroundColors.secondary,
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
  textField: {
    display: 'flex',
    borderRadius: 5,
    '& .css-9ddj71-MuiInputBase-root-MuiOutlinedInput-root': {
      backgroundColor: '#FFFF',
      height: 41,
    },
  },
  title: {
    color: colors.system.textColors.primary,
    fontSize: 20,
    textTransform: 'capitalize',
  },
  icon: { color: '#A7C957' },
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
    height: '100px',
    backgroundColor: colors.system.backgroundColors.secondary,
  },
  progressBar: { width: '100%', minWidth: '35px', margin: 0 },
  progressArea: { display: 'flex', alignItems: 'center' },
  pageFooter: {
    display: 'flex',
    alignItems: 'center',
    width: '100%',
    justifyContent: 'center',
    marginBottom: '10px',
  },
  circularProgress: {
    width: '100%',
    fontSize: '14px',
    display: 'flex',
    justifyContent: 'center',
    marginBottom: '10px',
  },
  titleProgress: {
    fontWeight: 700,
    fontSize: '14px',
    color: colors.system.backgroundColors.secondary,
  },
})
