;(function ($, window, undefined) {	
    $(document).ready(function () {
		var LG=$("body").attr("lg"),URL=$("body").attr("url")+'admin/',CTL=$("body").attr("ctl"),ACT=$("body").attr("act");
    	$("#calendar").calender();
    	var today=new Date();
        var _month=(today.getMonth()+1).toString();
        var _day=(today.getDate()).toString();
        if(_month.length==2)month=_month; else month="0"+_month;
        if(_day.toString().length==2)day=_day; else day="0"+_day;
        var year=today.getFullYear();
        var _date=day+'-'+month+'-'+year;
    	var myData={"date":_date}
    	var table = $('#logs-list').DataTable({
	  		"iDisplayLength": 10,           
            "order": [],
            "paging": true,     
            "bAutoWidth": false,  
            "bSort": true,
            "processing": true,
            /*"serverSide": true,*/ 
            "aoColumnDefs": [
                { "aTargets": [ 0 ], "bSortable": true },
                { "aTargets": [ 1 ], "bSortable": true },
                { "aTargets": [ 2 ], "bSortable": true },
                { "aTargets": [ 3 ], "bSortable": true },
                { "aTargets": [ 4 ], "bSortable": true },
                { "aTargets": [ -1 ], className: "text-right"},
                { "aTargets": [ '_all' ], "bSortable": false }                
            ],  
            "columns": [
                { "data": "ip" },
                { "data": "visitor" },
                { "data": "browser" },
                { "data": "os" },
                { "data": "url" },
                { "data": "datetime" }
            ],
            "ajax": {                   
                "url": URL+CTL+"/getLogs",
                "data": function (d) {
                    return  $.extend(d, myData);
                },
                "type": "POST"
            },
            "fnDrawCallback": function( oSettings ) {
                $('[data-toggle="tooltip"]').tooltip();
            }
	  	})
	  	$(".datepicker .datepicker-days").on('click','td.day',function () {
	  		if(!$(this).hasClass('disabled')){
			    var _getdate=new Date($(this).data('date'));
                var _month=(_getdate.getMonth()+1).toString();
                var _day=(_getdate.getDate()).toString();
                if(_month.length==2)month=_month; else month="0"+_month;
                if(_day.toString().length==2)day=_day; else day="0"+_day;
                var year=_getdate.getFullYear();
                var _getdate=day+'-'+month+'-'+year;
			    $('.delete-log').attr('data-log',_getdate);
			    myData.date=_getdate;
            	table.ajax.reload();
	  		}
		});
		$(".delete-log").on("click",function () {
			$.post(URL+CTL+"/delLogs",{folder:$(this).attr("data-log")},function (o) {
				if(o)location.reload();else{
	  				alert("Delete logs unsuccessful");
	  			}
			},'json');
		})
    });
})(jQuery, window);
