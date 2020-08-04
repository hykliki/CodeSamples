import { createReducer, on } from '@ngrx/store';
import { increment, decrement, reset, initRefData, initStringData } from './counter.actions';
import { RefData } from './my-counter/ref-data-interface';

export const initialState = 0;
export const initRefDataInitial:RefData = {
    refData: 'hellothere'
}

const _counterReducer = createReducer(initialState, 
    on(increment, state => state + 1),
    on(decrement, state => state - 1),
    on(reset, state => 0),
);

const _refDataReducer = createReducer(initRefDataInitial, 
    on(initRefData, r => ({refData: 'hellothere2'}))
);

export function counterReducer(state, action) {
    return _counterReducer(state, action);
}

export function refDataReducer(state, action) {
    return _refDataReducer(state, action);
}

const _stringData = createReducer('hellostring', 
on(initStringData, r => 'hello2')
);

export function stringDataReducer(state, action) {
    return _stringData(state, action);
}