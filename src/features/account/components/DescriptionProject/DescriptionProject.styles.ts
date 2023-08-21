import { makeStyles } from '@material-ui/core'
import { colors } from '_config'

export const useStyles = makeStyles({
  inputTitle: {
    fontSize: '20px',
    fontWeight: 600,
    display: 'flex',
    marginBottom: '10px',
    justifyContent: 'center',
    color: colors.system.textColors.secondary,
  },

  inputSubTitle: {
    fontSize: '16px',
    fontWeight: 600,
    display: 'flex',
    marginBottom: '10px',
    justifyContent: 'center',
    color: colors.system.textColors.secondary,
  },

  textField: {
    marginTop: '4px',
    textAlign: 'justify',
  },
})
