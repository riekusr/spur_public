dynamic getOperatorString(String abOperator, String card) {
  String cardSmalloutput = '';
  Map cardLargeoutput = {'pre': 'xx', 'post': 'xx'};
  switch (abOperator) {
    case 'equal':
      {
        cardSmalloutput = 'is equal to';
        cardLargeoutput['pre'] = 'equal';
        cardLargeoutput['post'] = ' to ';
      }
      break;

    case 'notequal':
      {
        cardSmalloutput = 'is not equal to';
        cardLargeoutput['pre'] = 'not equal';
        cardLargeoutput['post'] = ' to ';
      }
      break;

    case 'greater':
      {
        cardSmalloutput = 'is greater than';
        cardLargeoutput['pre'] = 'greater';
        cardLargeoutput['post'] = ' than ';
      }
      break;

    case 'less':
      {
        cardSmalloutput = 'is less than';
        cardLargeoutput['pre'] = 'less';
        cardLargeoutput['post'] = ' than ';
      }
      break;

    case 'greaterorequal':
      {
        cardSmalloutput = 'is equal or greather than';
        cardLargeoutput['pre'] = 'equal or greather';
        cardLargeoutput['post'] = ' than ';
      }
      break;

    case 'lessorequal':
      {
        cardSmalloutput = 'is equal or less than';
        cardLargeoutput['pre'] = 'equal or less';
        cardLargeoutput['post'] = ' than ';
      }
      break;
  }
  if (card == 'large') {
    return cardLargeoutput;
  }
  return cardSmalloutput;
}
