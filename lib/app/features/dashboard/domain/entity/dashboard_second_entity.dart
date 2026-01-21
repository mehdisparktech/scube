class DashboardSecondEntity {
  final String totalPower;
  final String electricityLabel;
  final double donutChartProgress;

  // Data List items
  final List<DataListItem> dataList;

  const DashboardSecondEntity({
    required this.totalPower,
    required this.electricityLabel,
    required this.donutChartProgress,
    required this.dataList,
  });
}

class DataListItem {
  final String title;
  final String status;
  final String data1;
  final String data2;
  // Use generic types or strings for UI mapping in presentation layer if strictly clean,
  // but for simplicity here we might store strings that map to icons/colors in UI.
  // Ideally entities shouldn't know about UI Colors/Icons, but let's store abstract types/enums.
  final String type; // e.g., 'solar', 'asset', 'power'

  const DataListItem({
    required this.title,
    required this.status,
    required this.data1,
    required this.data2,
    required this.type,
  });
}
