module MembersHelper
  def members_options_for_select
    Member.active.map do |member|
      [ member.full_name, member.id ]
    end
  end
end
