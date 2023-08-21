# Padronização

Visando garantir a legibilidade e manutenibilidade do projeto, foram estabelecidos padrões tanto estruturais quanto de código.

### Imports

O projeto está configurado para ser possível fazer imports com caminho absoluto a partir da pasta `src/` e o uso dessa feature é indicado.

```typescript
// Import relativo
import { http } from '../../_config/http'
// Import absoluto
import { http } from '_config/http' // Equivalente à src/_config/http
```

### Uso da biblioteca React

O uso de recursos da biblioteca React deverá ser feito usando `React.` como prefixo.

```typescript
// Hooks
const [myState, setMyState] = React.useState()

// Types
const MyComponent: React.FC = () => {
  /* ... */
}
```

### Componentes

Todo componente deverá ser nomeado seguindo o padrão PascalCase, ser declarado como arrow function e se receber props, deverá ser definida também a interface das props.

##### Estrutura de pastas e arquivos

```
Component/
	index.ts
	Component.tsx
	Component.scss (opcional)
```

##### Criação do componente

```typescript
interface MyComponentProps {
  /* ... */
}

export const MyComponent: React.FC<MyComponentProps> = ({}) => {}
```

##### Redux

A conexão dos componentes com o Redux deve ser feita através de hooks.

```typescript
// ...
export const MyComponent: React.FC<MyComponentProps> = ({}) => {
  const myState = useSelector((state: RootState) => state.myState)
  // ou
  const { data1, data2 } = useSelector((state: RootState) => state.myState)

  const dispatch = useDispatch()

  const onMyButtonClick = (event: React.MouseEvent<HTMLButtonElement>) => {
    dispatch(myActionCreator())
  }
}
```

##### Event Handlers

Event handlers devem ser declarados como arrow function, definir o tipo do evento e seguirem a seguinte nomenclatura: `on<Elemento ou Componente><Tipo de evento>`.

```typescript
// ...
export const MyComponent: React.FC<MyComponentProps> = ({}) => {
  // ...
  const onNameInputChange = (event: React.ChangeEvent<HTMLInputElement>) => {
    /* ... */
  }
}
```

##### Estrutura interna do componente

Esta estrutura é somente um guia, dependendo da lógica interna do componente essa estrutura pode ser alterada.

```typescript
interface MyComponentProps {
  /* ... */
}

export const MyComponent: React.FC<MyComponentProps> = ({}) => {
  // ---- Estado ----
  // React hooks: useContext, useMemo, useReducer, useRef, useState.
  // Hooks de terceiros
  // Custom hooks
  // ----------------

  // ---- Funcionalidade/Efeito ----
  // React.useEffect
  // Funções aulixiares, regra de negócio, etc. (Podem ser declarados dentro de hooks)
  // Event handlers. (Podem ser declarados dentro de hooks)
  // --------------------------------
  return JSX
}
```

Exemplo:

```typescript
interface MyComponentProps {
  /* ... */
}

export const MyComponent: React.FC<MyComponentProps> = ({}) => {
  // ---- Estado ----
  // React hooks: useContext, useMemo, useReducer, useRef, useState.
  const [myState, setMyState] = React.useState()
  // Hooks de terceiros
  const myThirdPartyState = useThirdPartyHook()
  // Custom hooks
  const myCustomState = useCustomHook()
  const myMemoizedValue = React.useMemo(() => {
    /* ... */
  }, [])
  // ----------------

  // ---- Funcionalidade/Efeito ----
  // React.useEffect
  React.useEffect(() => console.log('effect'), [])

  // Funções aulixiares, regra de negócio, etc. (Podem ser declarados dentro de hooks)
  const doSomething = () => console.log('Did something')
  const doSomethingElse = React.useCallback(() =>
    console.log('Did something else'),
  )
  // Event handlers. (Podem ser declarados dentro de hooks)
  const onMyInputChange = (event: React.ChangeEnvent<HTMLInputElement>) => {
    /* ... */
  }
  // --------------------------------

  return JSX
}
```
