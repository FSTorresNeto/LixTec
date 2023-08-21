import DateFnsUtils from '@date-io/date-fns'
import { CssBaseline, Box, MuiThemeProvider } from '@material-ui/core'
import { MuiPickersUtilsProvider } from '@material-ui/pickers'
import { StoreProvider } from '../../redux/StoreProvider'
import { useStyle } from './App.style'
import { ConfigContextProvider } from '../../_config'
import { Router } from 'components/Router'

export const App: React.FC = () => {
  const style = useStyle()

  return (
    <StoreProvider>
      <MuiPickersUtilsProvider utils={DateFnsUtils}>
        <ConfigContextProvider>
          <CssBaseline />
          <Box className={style.app}>
            <Router />
          </Box>
        </ConfigContextProvider>
      </MuiPickersUtilsProvider>
    </StoreProvider>
  )
}
