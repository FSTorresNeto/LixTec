import { Box, Typography } from '@material-ui/core'
import { useStyles } from './DescriptionProject.styles'

export const DescriptionProject = () => {
  const style = useStyles()

  return (
    <Box className={style.textField}>
      <Typography className={style.inputTitle}>
        Um pouquinho sobre nós
      </Typography>

      <Typography className={style.inputSubTitle}>
        Sobre o lixo eletronico
      </Typography>

      <Typography>
        O aplicativo da LixTec tem por objetivo auxiliar na reciclagem de lixo
        eletrônico, onde o usuario pode realizar depositos em pontos de coleta e
        ganhar pontos para que possam conseguir produtos por meio de sistemas de
        bonificação.
      </Typography>
    </Box>
  )
}
