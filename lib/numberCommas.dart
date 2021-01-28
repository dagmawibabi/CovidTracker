RegExp reg = new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
Function mathFunc = (Match match) => '${match[1]},';

List<String> tests = [
  '0',
  '10',
  '123',
  '1230',
  '12300',
  '123040',
  '12k',
  '12 ',
];

/*tests.forEach((String test) {
  String result = test.replaceAllMapped(reg, mathFunc);
  print('$test -> $result');
});*/
