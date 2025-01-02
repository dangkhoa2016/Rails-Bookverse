module MembersHelper
  def members_options_for_select
    Member.all.map do |member|
      [ member.full_name, member.id ]
    end
  end
end
