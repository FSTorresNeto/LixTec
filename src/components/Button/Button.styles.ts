import { makeStyles, Theme } from '@material-ui/core'

export interface ButtonStylesProps {
  variant?: 'outlined' | 'contained' | 'text'
  size?: 'small' | 'medium' | 'large'
  palette?: 'primary' | 'secondary'
}

export const useStyles = makeStyles<Theme, ButtonStylesProps, 'button'>({
  button: {
    height: '36px',
    fontSize: '12px',
    borderRadius: '4px',

    '& .MuiButton-label': {
      textTransform: 'none',
      textAlign: 'center',
    },
    '&.MuiButton-sizeSmall': {
      fontSize: '10px',
      height: '26px',
    },
    '& .MuiButton-iconSizeSmall': {
      '& > *:first-child, & > *:last-child': {
        fontSize: '14px',
      },
    },
    '&.MuiButton-sizeLarge': {
      minWidth: '120px',
      fontSize: '12px',
      height: '36px',
    },
    '& .MuiButton-startIcon, & .MuiButton-endIcon': {
      height: 24,
      '& img, & svg': {
        height: '100%',
      },
    },
  },
})
