import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ClickOutsideDrectiveTestComponent } from './click-outside-drective-test.component';

describe('ClickOutsideDrectiveTestComponent', () => {
  let component: ClickOutsideDrectiveTestComponent;
  let fixture: ComponentFixture<ClickOutsideDrectiveTestComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ClickOutsideDrectiveTestComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ClickOutsideDrectiveTestComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
