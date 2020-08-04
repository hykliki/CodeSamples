import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { MyButtonTestComponent } from './my-button-test.component';

describe('MyButtonTestComponent', () => {
  let component: MyButtonTestComponent;
  let fixture: ComponentFixture<MyButtonTestComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ MyButtonTestComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(MyButtonTestComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
