import { FunctionComponent } from 'react'

import { useStyles } from './DepositProgress.styles'
import { Box, CircularProgress, Typography } from '@material-ui/core'

interface CircularProgressProps {
  progress?: number
}

export const DepositProgress: FunctionComponent<CircularProgressProps> = ({
  progress,
}) => {
  const styles = useStyles()
  return (
    <Box className={styles.progressArea}>
      <Box mr={3} className={styles.progressBar}>
        <Box
          style={{
            position: 'relative',
            display: 'inline-flex',
            padding: '10px',
          }}
        >
          <CircularProgress
            variant="determinate"
            value={progress}
            className={styles.circularProgress}
          />
          <Box
            style={{
              top: 0,
              left: 0,
              bottom: 0,
              right: 0,
              position: 'absolute',
              display: 'flex',
              alignItems: 'center',
              justifyContent: 'center',
              margin: 0,
            }}
          >
            <Typography variant="caption" component="div">{`${Math.round(
              progress!,
            )}Kg`}</Typography>
          </Box>
        </Box>
      </Box>
    </Box>
  )
}
