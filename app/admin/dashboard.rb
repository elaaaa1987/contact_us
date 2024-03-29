ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    # div class: "blank_slate_container", id: "dashboard_default_message" do
    #   span class: "blank_slate" do
    #     span I18n.t("active_admin.dashboard_welcome.welcome")
    #     small I18n.t("active_admin.dashboard_welcome.call_to_action")
    #   end
    # end

    # Here is an example of a simple dashboard with columns and panels.
    columns do
      column do
        panel "Admin users" do
          ul do
            AdminUser.first(5).map do |admin|
              li link_to(admin.email, admin_admin_user_path(admin))
            end
          end
        end
      end
      column do
        panel "Recent Contacts" do
          ul do
            Contact.recent(5).map do |contact|
              li link_to(contact.name, admin_contact_path(contact))
            end
          end
        end
      end

    #   column do
    #     panel "Info" do
    #       para "Welcome to ActiveAdmin."
    #     end
    #   end
     end
  end # content
end
