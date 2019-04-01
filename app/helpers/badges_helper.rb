module BadgesHelper
  Badge::RULES.map { |name| { I18n.t("helpers.badges.#{name}") => name } }
end
