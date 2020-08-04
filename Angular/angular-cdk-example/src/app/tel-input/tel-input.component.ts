import { Component, OnInit, Input, OnDestroy, HostBinding, Optional, Self } from '@angular/core';
import { FormGroup, FormBuilder, NgControl } from '@angular/forms';
import { Telephone } from './telephone';
import { MatFormFieldControl } from '@angular/material';
import { Observable, Subject } from 'rxjs';
import { ThrowStmt } from '@angular/compiler';

@Component({
  selector: 'app-tel-input',
  templateUrl: './tel-input.component.html',
  styleUrls: ['./tel-input.component.scss'],
  providers: [{provide: MatFormFieldControl, useExisting: TelInputComponent}]
})
export class TelInputComponent implements OnInit, OnDestroy, MatFormFieldControl<Telephone> {
  parts: FormGroup;

  @Input() get value(): Telephone|null {
    let n = this.parts.value;
    if (n.area.length == 3 && n.exchange.length == 3 && n.subscriber.length == 4) {
      return new Telephone(n.area, n.exchange, n.subscriber);
    }
    return null;
  } 
  set value(tel: Telephone | null) {
    tel = tel || new Telephone('', '', '');
    this.parts.setValue({area: tel.area, exchange: tel.exchange, subscriber: tel.subscriber});
    this.stateChanges.next();
  }

  /** Inject form builder ! */
  constructor(fb: FormBuilder, @Optional() @Self() ngControl:NgControl) {
    this.parts =  fb.group({
      'area': '',
      'exchange': '',
      'subscriber': '',
    });
  }
  stateChanges: Subject<void> = new Subject<void>();
  static nextId = 0;
  @HostBinding() id: string = `app-tel-input-${TelInputComponet.nextId++}`;
  _placeholder: string;
  @Input()
  get placeholder() {
    return this._placeholder;
  }

  set placeholder(p) {
    this._placeholder = p;
    this.stateChanges.next;
  }


  ngControl: NgControl = null;
  focused: boolean;
  empty: boolean;
  shouldLabelFloat: boolean;
  required: boolean;
  disabled: boolean;
  errorState: boolean;
  controlType?: string;
  autofilled?: boolean;
  setDescribedByIds(ids: string[]): void {
    throw new Error("Method not implemented.");
  }
  onContainerClick(event: MouseEvent): void {
    throw new Error("Method not implemented.");
  }


  ngOnInit() {
  }

  ngOnDestroy() {
    this.stateChanges.complete();
  }

}
