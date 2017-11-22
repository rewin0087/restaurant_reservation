$(document).ready () ->
  nowTemp = new Date()
  now = new Date(nowTemp.getFullYear(), nowTemp.getMonth(), nowTemp.getDate(), 0, 0, 0, 0)
  $('#reservation_date_time').fdatepicker
    format: 'yyyy-mm-dd hh:ii',
    pickTime: true
    leftArrow: '<<'
    rightArrow: '>>'
    disableDblClickSelection: true
    onRender: (date) =>
      if date.valueOf() < now.valueOf()
        'disabled'
      else
        ''

