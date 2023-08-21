export interface TrashListResponse {
  data: TrashListData[]
}

export interface TrashListData {
  street?: string
  name?: string
  number?: string
}
