import { Container, Box, Typography, Button } from '@material-ui/core'
import { useStyles } from './SelectOption.styles'
import QrCodeScannerIcon from '@mui/icons-material/QrCodeScanner'

interface ISelectOptionProps {
  onMoveToHome: VoidFunction
  onMoveToGenerateQrCode: VoidFunction
}

export const SelectOptionView: React.FC<ISelectOptionProps> = ({
  onMoveToHome,
  onMoveToGenerateQrCode,
}) => {
  const style = useStyles()

  return (
    <Container className={style.container}>
      <Box className={style.topHeader}></Box>
      <Typography className={style.inputTitle}>Escolha uma opção</Typography>
      <Box className={style.header}>
        <Button className={style.button} onClick={onMoveToGenerateQrCode}>
          <Box className={style.icon}>
            <QrCodeScannerIcon />
          </Box>
          <Box className={style.title}>
            <Box className={style.title}>
              <Typography>Gerar QrCode</Typography>
            </Box>
          </Box>
        </Button>

        <Button className={style.button} onClick={onMoveToGenerateQrCode}>
          <Box className={style.icon}>
            <QrCodeScannerIcon />
          </Box>
          <Box className={style.title}>
            <Box className={style.title}>
              <Typography>Listagem de lixeiras disponiveis</Typography>
            </Box>
          </Box>
        </Button>
      </Box>
      W
      <Box className={style.signOut}>
        <Button onClick={onMoveToHome}>Voltar</Button>
      </Box>
      <Box className={style.bottomHeader}></Box>
    </Container>
  )
}
