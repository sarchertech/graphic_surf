function mark_for_destroy(element) {
	$(element).previous('.should_destroy').value = 1;
	$(element).up('.project_picture_field_wrapper').hide();
}