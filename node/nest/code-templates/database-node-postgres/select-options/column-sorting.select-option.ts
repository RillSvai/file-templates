import { SortOrder } from '../enums/sort-order.enum';

export class ColumnSorting {
  column: string;
  sortOrder: SortOrder;

  constructor(column: string, sortOrder: SortOrder) {
    this.column = column;
    this.sortOrder = sortOrder;
  }
}
