class BadgeService
  def initialize(test_passage)
    @user = test_passage.user
    @test = test_passage.test

  end

  def select_badge
    Badge.all.select do |badge|
      send(badge.rule, badge.rule_params)
    end
  end

  private

  def test_from_one_complexity(complexity)
    return false if @test.complexity != complexity.to_i
    test_ids = Test.where(complexity: complexity).ids
    success_tests_ids = @user.test_passages.where(test_id: test_ids).success.map(&:test_id)
    test_ids.count == success_tests_ids.uniq.count && success_tests_ids.group_by(&:itself).values.map(&:size).uniq.size == 1

  end

  def test_from_first_try(_test)
    @user.test_passages.where(test_id: @test.id).success.count == 1
  end

  def tests_from_one_category(category)
    return false if @test.category_id != category.to_i
    test_ids = Test.where(category_id: category).ids
    success_tests(test_ids) == test_ids.count
  end

  def success_tests(ids)
    @user.test_passages.where(test_id: ids).success.uniq.count
  end
end
