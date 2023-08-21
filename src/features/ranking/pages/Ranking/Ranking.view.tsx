import { Box, Button, Container, Typography } from '@material-ui/core'
import { useStyles } from './Ranking.styles'
import { DepositProgress } from 'features/ranking/components'

interface IRankingViewProps {
  onBackButton: VoidFunction
  progress?: number
}

export const RankingView: React.FC<IRankingViewProps> = ({
  onBackButton,
  progress,
}) => {
  const styles = useStyles()
  return (
    <Container className={styles.container}>
      <Box className={styles.topHeader} />
      <Typography
        variant="body2"
        color="textSecondary"
        className={styles.titleProgress}
      >
        Valor em volume de seus depósitos
      </Typography>

      <DepositProgress progress={progress} />

      <Box className={styles.pageFooter}>
        <Button className={styles.button} onClick={onBackButton}>
          Sair
        </Button>
      </Box>
      <Box className={styles.bottomHeader} />
    </Container>
  )
}
