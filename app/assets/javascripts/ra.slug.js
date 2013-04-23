//=require 'jquery.slugify'


$(document).on('rails_admin.dom_ready', function() {
  return $('input[data-slug]').each(function() {
    var slug_from = '#' + $(this).data('slug');
    return $(this).slugify(slug_from);
  });
});

