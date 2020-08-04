import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { DynamicComponentCreationTestComponent } from './dynamic-component-creation-test.component';

describe('DynamicComponentCreationTestComponent', () => {
  let component: DynamicComponentCreationTestComponent;
  let fixture: ComponentFixture<DynamicComponentCreationTestComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ DynamicComponentCreationTestComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(DynamicComponentCreationTestComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
