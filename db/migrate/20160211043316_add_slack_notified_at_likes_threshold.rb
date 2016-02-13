class AddSlackNotifiedAtLikesThreshold < ActiveRecord::Migration
  def up
    execute <<-SQL
      alter table posts add column slack_notified_at_likes_threshold integer[] default '{}';
      update posts set slack_notified_at_likes_threshold = slack_notified_at_likes_threshold || 10 where likes >= 10;
      update posts set slack_notified_at_likes_threshold = slack_notified_at_likes_threshold || 20 where likes >= 20;
      update posts set slack_notified_at_likes_threshold = slack_notified_at_likes_threshold || 30 where likes >= 30;
      update posts set slack_notified_at_likes_threshold = slack_notified_at_likes_threshold || 40 where likes >= 40;
    SQL
  end

  def down
    execute <<-SQL
      alter table posts drop column slack_notified_at_likes_threshold;
    SQL
  end
end
