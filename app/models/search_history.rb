class SearchHistory
  include ActiveModel::Model

  def self.clear
    Query.destroy_all
    # .delete_all is more performant; however, it won't
    # delete associated records.
    # Add a test to ensure that comments and its underlying
    # rich text is also deleted, and you'll see that it's not.
    #
    # To help mitigate some of the performance here, we'll
    # still have to instantiate query objects, but if we
    # set the comments dependent option to `:destroy_async`,
    # then that'll happen in a separate background job.
    #
    # Another option would be to explicitly do `Comment.delete_all` here too -
    # and we can, but we need to make sure we also delete its underlying rich
    # text content, and any attachments associated with that.
    # Managing the complexity of all the ActionText deletion mitigation may not
    # be worth it, which requires us to eat the cost of creating these objects.
    #
    # Perhaps a middleground might be to do Query.delete_all and
    # Comment.destroy_all. Not sure without benchmarking, but I don't want to be
    # in the business of having to manage the complexity of ActionText.
  end
end
