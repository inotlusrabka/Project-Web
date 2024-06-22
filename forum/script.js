$('#editDeletePostModal').on('show.bs.modal', function (event) {
    var button = $(event.relatedTarget);
    var postId = button.data('id');
    var postTitle = button.data('title');
    var postContent = button.data('message');
    var modal = $(this);
    modal.find('#edit-post-id').val(postId);
    modal.find('#edit-post-title').val(postTitle);
    modal.find('#edit-post-content').val(postContent);
});

$('#deletePostBtn').on('click', function() {
    var postId = $('#edit-post-id').val();
    if (confirm('Are you sure you want to delete this post?')) {
        $.post('delete_post.php', { postId: postId }, function(response) {
            location.reload();
        });
    }
});

$('#editDeletePostForm').on('submit', function(event) {
    event.preventDefault();
    $.post('edit_post.php', $(this).serialize(), function(response) {
        location.reload();
    });
});
