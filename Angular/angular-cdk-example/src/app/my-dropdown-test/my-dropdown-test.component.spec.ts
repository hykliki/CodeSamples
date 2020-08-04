import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { MyDropdownTestComponent } from './my-dropdown-test.component';

describe('MyDropdownTestComponent', () => {
  let component: MyDropdownTestComponent;
  let fixture: ComponentFixture<MyDropdownTestComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ MyDropdownTestComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(MyDropdownTestComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
