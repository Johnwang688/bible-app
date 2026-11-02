// Jest setup (orchestrator-owned). TanStack Query hands results to React on a setTimeout(0) by
// default, which lands after `act()` returns; deliver them on a microtask in tests so `act` sees them.
import { notifyManager } from '@tanstack/react-query';

notifyManager.setScheduler((cb) => queueMicrotask(cb));
