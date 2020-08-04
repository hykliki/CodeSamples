import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { PassingArrayTestComponent } from './passing-array-test.component';

describe('PassingArrayTestComponent', () => {
  let component: PassingArrayTestComponent;
  let fixture: ComponentFixture<PassingArrayTestComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ PassingArrayTestComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(PassingArrayTestComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
