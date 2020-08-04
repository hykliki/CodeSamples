import { Component, OnInit } from '@angular/core';
import { Observable } from 'rxjs';
import { select, Store } from '@ngrx/store';
import { increment, decrement, reset, initRefData } from '../counter.actions';
import { R3BaseRefMetaData } from '@angular/compiler';
import { RefData } from './ref-data-interface';

@Component({
  selector: 'app-my-counter',
  templateUrl: './my-counter.component.html',
  styleUrls: ['./my-counter.component.scss']
})
export class MyCounterComponent implements OnInit {

  count$: Observable<number>;
  refData$: Observable<RefData>;
  stringData$: Observable<string>;


  constructor(private store: Store<{count: number}>, private store2: Store<{refData: RefData}>, private stringDataStore: Store<{stringData: string}>) { 
    //store.dispatch(initRefData());
    this.count$ = store.pipe(select('count'));
    this.refData$ = store2.pipe(select('refData'));
    this.stringData$ = stringDataStore.pipe(select('stringData'));
  }

  increment() {
    this.store2.dispatch(initRefData());
    this.store.dispatch(increment());
    console.info(this.refData$);
  }

  derement() {
    this.store.dispatch(decrement());
  }

  reset() {
    //this.store.dispatch(reset());
  }

  ngOnInit() {
  }

}
