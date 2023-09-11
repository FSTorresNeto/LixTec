import {
  Container,
  Box,
  Typography,
  FormControlLabel,
  Checkbox,
  Divider,
  Button,
} from '@material-ui/core'
import { useStyles } from './Terms.styles'

interface ITermsViewProps {
  acceptTerms: boolean
  onAcceptTerms: VoidFunction
  onRefuseTerms: VoidFunction
  onMoveToConclude: VoidFunction
}

export const TermsView: React.FC<ITermsViewProps> = ({
  acceptTerms,
  onAcceptTerms,
  onMoveToConclude,
  onRefuseTerms,
}) => {
  const style = useStyles()

  return (
    <Container className={style.container}>
      <Box className={style.header}>
        <Typography className={style.title}>Termos de uso</Typography>

        <Box>
          <Typography className={style.textField}>
            TERMOS DE USO DO APLICATIVO Bem-vindo ao aplicativo LixTec. Ao usar
            este aplicativo, você concorda com os seguintes termos e condições
            de uso. Se você não concordar com esses termos, por favor, não use o
            aplicativo. 1. Informações Coletadas O aplicativo LixTec coleta as
            seguintes informações do usuário: Nome, Telefone, Email, Dados de
            Depósito. 2. Compartilhamento de Informações O aplicativo LixTec
            poderá compartilhar suas informações apenas nas seguintes
            circunstâncias: apresentação em percentual de dados de clientes para
            apresentação de dados para a UFC. 3. Segurança das Informações
            Faremos todos os esforços razoáveis para garantir a segurança das
            informações que você nos forneceu, de acordo com as melhores
            práticas da indústria. 4. Consentimento Ao usar o Aplicativo, você
            concorda com a coleta, uso e compartilhamento de suas informações
            conforme descrito nestes Termos de Uso. 5. Alterações nos Termos de
            Uso Podemos atualizar estes Termos de Uso periodicamente. Quaisquer
            alterações significativas serão comunicadas a você por meio do
            aplicativo ou por outros meios adequados. 6. Contato Se você tiver
            alguma dúvida ou preocupação sobre estes Termos de Uso ou a coleta
            de informações, entre em contato conosco pelo email
            lixtec@gmail.com.br. Ao usar o aplicativo LixTec, você concorda em
            cumprir estes Termos de Uso. O não cumprimento destes termos pode
            resultar na suspensão ou encerramento de sua conta. Obrigado por
            usar o nocco aplicativo!
          </Typography>
        </Box>

        <FormControlLabel
          control={
            <Checkbox
              className={style.checkbox}
              value={acceptTerms}
              onClick={onAcceptTerms}
            />
          }
          label="Aceito os termos"
        />

        <Divider variant="middle" className={style.divider} />

        <Box className={style.pageFooter}>
          <Button className={style.button} onClick={onRefuseTerms}>
            Recusar
          </Button>

          <Button
            className={style.button}
            disabled={!acceptTerms}
            onClick={onMoveToConclude}
          >
            Próximo
          </Button>
        </Box>
      </Box>
    </Container>
  )
}
