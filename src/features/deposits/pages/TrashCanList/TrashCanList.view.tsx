/* eslint-disable react-hooks/exhaustive-deps */
import React from 'react'
import { useStyles } from './TrashCanList.styles'
import { Container, Box, Typography } from '@material-ui/core'
import { DepositsList } from 'features/deposits/components'
import { TrashList } from 'features/deposits/redux/models/TrashList'
import { Button } from 'components'
import { StoreState } from 'redux/state'
import { useSelector } from 'react-redux'

interface ITrashCanListProps {
  onBackButton: VoidFunction
}

export const TrashCanListView: React.FC<ITrashCanListProps> = ({
  onBackButton,
}) => {
  const style = useStyles()
  const authState = useSelector((state: StoreState) => state.deposits.trashList)

  const [displayCards, setDisplayCards] = React.useState(authState)

  React.useEffect(() => {
    setDisplayCards(authState)
  }, [authState])

  return (
    <Container className={style.container}>
      <Box className={style.topHeader} />

      <Typography className={style.inputTitle}>
        Lista de Lixeiras da cidade
      </Typography>

      <Box className={style.header}>
        {displayCards?.map(trashListData => (
          <DepositsList
            depositName={trashListData.name}
            street={trashListData.street}
            number={trashListData.number}
          />
        ))}
      </Box>

      <Box className={style.signOut}>
        <Button className={style.button} onClick={onBackButton}>
          Voltar
        </Button>
      </Box>

      <Box className={style.bottomHeader} />
    </Container>
  )
}
