
import 'package:cripto_app/model/moeda.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

enum CurrencyColumn { id, rank, name, price, oneHChange, oneDChange, marketCap }

class CurrencyDataSource extends DataGridSource {
  late List<DataGridRow> _currencies;

  @override
  List<DataGridRow> get rows => _currencies;

  CurrencyDataSource({required List<Currency> currencies}) {
    buildDataGrid(currencies);
  }

  void updateDataGridSource() => notifyListeners();

  void buildDataGrid(List<Currency> currencies) => _currencies = currencies
      .map<DataGridRow>(
        (currency) => DataGridRow(
      cells: CurrencyColumn.values
          .map(
            (column) => DataGridCell<CurrencyComparable>(
          columnName: column.toString(),
          value: CurrencyComparable(column, currency),
        ),
      )
          .toList(),
    ),
  )
      .toList();

  @override
  DataGridRowAdapter buildRow(DataGridRow row) => DataGridRowAdapter(
      cells: row.getCells().map<Widget>((dataGridCell) {
        final CurrencyComparable currencyWrapper = dataGridCell.value;
        final currency = currencyWrapper.currency;
        final column = CurrencyColumn.values
            .firstWhere((value) => value.toString() == dataGridCell.columnName);

        switch (column) {
          case CurrencyColumn.id:
            return buildIdRow(currency);
          case CurrencyColumn.rank:
            return buildRankRow(currency);
          case CurrencyColumn.name:
            return buildNameRow(currency.name);
          case CurrencyColumn.oneHChange:
            return buildPercentageRow(currency.oneHourChange);
          case CurrencyColumn.oneDChange:
            return buildPercentageRow(currency.oneDayChange);
          case CurrencyColumn.marketCap:
            return buildPriceRow(currency.marketCap);
          case CurrencyColumn.price:
            return buildPriceRow(currency.price);
        }
      }).toList());

  Widget buildIdRow(Currency currency) => Container(
    padding: const EdgeInsets.all(12.0),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        buildLogo(currency),
        const SizedBox(width: 8),
        Expanded(child: Text(currency.id, overflow: TextOverflow.ellipsis))
      ],
    ),
  );

  Widget buildNameRow(name) => Container(
    alignment: Alignment.centerLeft,
    child: Text(name, overflow: TextOverflow.ellipsis),
  );

  Widget buildRankRow(Currency currency) {
    final icon =
    currency.rankDelta > 0 ? Icons.arrow_drop_up : Icons.arrow_drop_down;
    final color = getColor(currency.rankDelta.toDouble());

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (currency.rankDelta != 0) Icon(icon, color: color),
        if (currency.rankDelta == 0) const SizedBox(width: 24),
        Text(currency.rank.toString(), style: TextStyle(color: color)),
      ],
    );
  }

  Widget buildPriceRow(double price) => Container(
    padding: const EdgeInsets.all(16),
    child: Text(
      '\$${formatPrice(price)}',
      style: const TextStyle(color: Colors.tealAccent),
    ),
  );

  String formatPrice(double price) {
    if (price > 999999999) {
      final newPrice = (price / 1000000000).toStringAsFixed(3);
      return '$newPrice B';
    } else if (price > 999999) {
      final newPrice = (price / 1000000).toStringAsFixed(3);
      return '$newPrice M';
    } else if (price > 99999) {
      final newPrice = (price / 1000).toStringAsFixed(3);
      return '$newPrice K';
    } else {
      return price.toStringAsFixed(3);
    }
  }

  Widget buildPercentageRow(double change) {
    final color = getColor(change);

    return Row(
      children: [
        buildArrowIcon(change),
        Expanded(
          child: Text(
            change.toStringAsFixed(3) + '%',
            style: TextStyle(fontSize: 14, color: color),
          ),
        )
      ],
    );
  }

  Widget buildLogo(Currency currency) {
    final isSvg = currency.logoUrl.endsWith('.svg');

    return CircleAvatar(
      radius: 10,
      child: isSvg
          ? SvgPicture.network(currency.logoUrl)
          : Image.network(currency.logoUrl),
    );
  }

  Widget buildArrowIcon(double value) {
    final icon = value > 0 ? Icons.arrow_drop_up : Icons.arrow_drop_down;
    final color = getColor(value);

    return Icon(icon, color: color);
  }

  Color getColor(double value) {
    if (value > 0) {
      return Colors.green;
    } else if (value < 0) {
      return Colors.red;
    } else {
      return Colors.white;
    }
  }
}