import React from 'react'
import { useHistory } from 'react-router-dom'
import { AboutView } from './About.view'

export const About: React.FC = () => {
  const history = useHistory()

  const onBackButton = () => {
    history.goBack()
  }

  return <AboutView onBackButton={onBackButton} />
}
