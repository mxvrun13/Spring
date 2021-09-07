let replyService = (function() {
	function add(callback, error) {
		$.ajax({
			url: "../reply/",
			data: $("#replyForm").serialize(),
			method: "POST",
			dataType: "json",
			success: function(data) {
				if (callback) callback(data);
			},
			error: function() {
				if (error) error();
			}
		});
	}
	// 와 앞자리진짜부담스럽다...
	function getList(param, callback, error) {
		$.ajax({
			url: "../reply/",
			data: param,
			dataType: "json",
			success: function(data) {
				if (callback) callback(data);
			},
			error: function() {
				if (error) error();
			}
		});
	}
	return { add: add, getList: getList }
})();