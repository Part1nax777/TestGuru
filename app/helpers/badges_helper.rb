module BadgesHelper
  def rule_localization
    Badge::RULES.map { |name| [t("helpers.badges.#{name}"), name] }
  end
end
