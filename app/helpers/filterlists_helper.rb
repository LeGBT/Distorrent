module FilterlistsHelper
  def inc
    filterlist.update_attribute(:ep => 1)
  end
end
