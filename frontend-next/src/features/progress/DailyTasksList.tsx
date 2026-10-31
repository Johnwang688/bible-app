import CurrencyIcon from '@/components/CurrencyIcon';

export function DailyTasksList({
  taskChapterDone,
  taskAiDone,
  taskMinutesDone,
  dailyGoalMinutes,
  signedIn,
  tasksBonusClaimed,
  onClaimTasksBonus,
  tasksBonusClaiming,
}: {
  taskChapterDone: boolean;
  taskAiDone: boolean;
  taskMinutesDone: boolean;
  dailyGoalMinutes: number;
  signedIn?: boolean;
  tasksBonusClaimed?: boolean;
  onClaimTasksBonus?: () => void;
  tasksBonusClaiming?: boolean;
}) {
  const rows = [
    { done: taskAiDone, label: 'Talk to the AI assistant once' },
    { done: taskChapterDone, label: 'Read one chapter of the Bible' },
    { done: taskMinutesDone, label: `Reach your daily active learning goal (${dailyGoalMinutes} min)` },
  ];
  const allDone = rows.every(r => r.done);
  return (
    <ul className="daily-goals-list" aria-label="Daily tasks">
      {rows.map((row, i) => (
        <li key={i} className={`daily-task${row.done ? ' daily-task--done' : ''}`}>
          <div className="daily-task-row">
            <span className="daily-task-check" aria-hidden="true">
              {row.done ? '✓' : '○'}
            </span>
            <span className="daily-task-label">{row.label}</span>
            <span className="daily-task-coins" aria-label="+10 coins">
              <><CurrencyIcon className="daily-task-coins-icon" size={14} />{!row.done ? ' +10' : null}</>
            </span>
          </div>
        </li>
      ))}
      {allDone && (
        <li className={`daily-task daily-task--bonus${tasksBonusClaimed ? ' daily-task--done' : ''}`}>
          <div className="daily-task-row daily-task-row--bonus">
            <span className="daily-task-check" aria-hidden="true">★</span>
            <span className="daily-task-label">All tasks complete</span>
            {tasksBonusClaimed ? (
              <span className="daily-task-coins daily-task-coins--bonus" aria-label="Bonus claimed">
                Claimed
              </span>
            ) : signedIn && onClaimTasksBonus ? (
              <button
                type="button"
                className="daily-task-claim-btn"
                disabled={tasksBonusClaiming}
                onClick={onClaimTasksBonus}
              >
                {tasksBonusClaiming ? '…' : 'Claim +20'}
              </button>
            ) : (
              <span className="daily-task-coins daily-task-coins--bonus" aria-label="+20 bonus coins"><CurrencyIcon className="daily-task-coins-icon" size={14} /> +20</span>
            )}
          </div>
          {!signedIn && (
            <p className="daily-task-bonus-hint">Sign in to claim your +20 coin bonus.</p>
          )}
        </li>
      )}
    </ul>
  );
}
