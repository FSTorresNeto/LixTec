import ReactDOM from 'react-dom'
import { App } from './components/App'
import * as serviceWorkerRegistration from './serviceWorkerRegistration'
import reportWebVitals from './reportWebVitals'

const rootElement = document.getElementById('root')
ReactDOM.render(<App />, rootElement)

serviceWorkerRegistration.register()

reportWebVitals()
