import 'package:cripto_app/provider/currency_provider.dart';
import 'package:cripto_app/utils/currency_data_source.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class CurrenciesWidget extends StatelessWidget {
  const CurrenciesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CurrencyProvider>(context);
    final currencyDataSource = provider.currencyDataSource;

    if (currencyDataSource == null) {
      return const Center(child: CircularProgressIndicator());
    } else {
      return SfDataGrid(
        allowSorting: true,
        defaultColumnWidth: 110,
        frozenColumnsCount: 1,
        columns: buildGridColumns(),
        source: currencyDataSource,
      );
    }
  }

  List<GridColumn> buildGridColumns() => <GridColumn>[
    GridColumn(
      columnName: CurrencyColumn.id.toString(),
      label: buildLabel('ID'),
    ),
    GridColumn(
      columnName: CurrencyColumn.rank.toString(),
      maximumWidth: 80,
      label: buildLabel('Rank'),
    ),
    GridColumn(
      columnName: CurrencyColumn.name.toString(),
      label: buildLabel('Name'),
    ),
    GridColumn(
      columnName: CurrencyColumn.price.toString(),
      label: buildLabel('Price'),
    ),
    GridColumn(
      columnName: CurrencyColumn.oneHChange.toString(),
      label: buildLabel('Last 1H'),
    ),
    GridColumn(
      columnName: CurrencyColumn.oneDChange.toString(),
      label: buildLabel('Last 1D'),
    ),
    GridColumn(
      columnName: CurrencyColumn.marketCap.toString(),
      label: buildLabel('Market Cap'),
    ),
  ];

  Widget buildLabel(String text) => Container(
    padding: const EdgeInsets.all(8),
    alignment: Alignment.center,
    child: Text(
      text,
    ),
  );
}