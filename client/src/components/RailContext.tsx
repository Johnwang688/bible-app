import { createContext, useContext } from 'react';

/** The width reserved for the rail actually on screen, including its floating inset. */
export const RailContext = createContext(0);
export const useRailWidth = () => useContext(RailContext);
