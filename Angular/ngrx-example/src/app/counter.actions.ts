import { createAction, props } from '@ngrx/store';
import { RefData } from './my-counter/ref-data-interface';

export const increment = createAction ('[Counter Component] Increment');
export const decrement = createAction ('[Counter Component] Decrement');
export const reset = createAction ('[Counter Component] Reset');
export const initRefData = createAction('[RefData] Init');
export const initStringData = createAction('[StringData] Init');