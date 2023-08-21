import { Box, Button, Typography } from '@material-ui/core'
import recyclingSymbol from '../../../../_assets/icons/recyclingSymbol.svg'
import DeleteSweepIcon from '@mui/icons-material/DeleteSweep'
import DiamondIcon from '@mui/icons-material/Diamond'
import { useStyles } from './FeatureButton.styles'

import RestoreFromTrashIcon from '@mui/icons-material/RestoreFromTrash'

interface IFeatureButtonViewProps {
  onMoveToAbout: VoidFunction
  onMoveToListDepositPoints: VoidFunction
  onMoveToQrCodeReader: VoidFunction
  onMoveToRanking: VoidFunction
}

export const FeatureButtonView: React.FC<IFeatureButtonViewProps> = ({
  onMoveToAbout,
  onMoveToListDepositPoints,
  onMoveToQrCodeReader,
  onMoveToRanking,
}) => {
  const style = useStyles()
  return (
    <Box className={style.header}>
      <Button className={style.buttonDeposits} onClick={onMoveToQrCodeReader}>
        <Box className={style.icon}>
          <RestoreFromTrashIcon />
        </Box>
        <Typography className={style.title}>Depósitos</Typography>
      </Button>

      <Button className={style.buttonRanking} onClick={onMoveToRanking}>
        <Box className={style.icon}>
          <DiamondIcon />
        </Box>
        <Typography className={style.title}>Ranking</Typography>
      </Button>

      <Button
        className={style.buttonAccount}
        onClick={onMoveToListDepositPoints}
      >
        <Box className={style.icon}>
          <DeleteSweepIcon />
          <Typography className={style.title}>Lixeiras</Typography>
        </Box>
      </Button>

      <Button className={style.buttonAbout} onClick={onMoveToAbout}>
        <Box className={style.icon}>
          <img src={recyclingSymbol} alt="" />
        </Box>
        <Typography className={style.title}>Sobre</Typography>
      </Button>
    </Box>
  )
}
