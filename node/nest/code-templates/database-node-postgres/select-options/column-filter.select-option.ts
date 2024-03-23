import { NumericFilterOption } from 'src/common/application/enums/filter-options/numeric.filter-option';
import { StringFilterOption } from 'src/common/application/enums/filter-options/string.filter-option';
import { FilterInput } from '../../application/inputs/filters/filter';

export class ColumnFilter {
  filterInputs: FilterInput<StringFilterOption | NumericFilterOption, number | string>[];
  column: string;

  constructor(filters: FilterInput<StringFilterOption | NumericFilterOption, number | string>[], column: string) {
    this.filterInputs = filters;
    this.column = column;
  }
}
