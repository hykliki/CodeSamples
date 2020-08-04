import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { InsertableComponent } from './insertable.component';

describe('InsertableComponent', () => {
  let component: InsertableComponent;
  let fixture: ComponentFixture<InsertableComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ InsertableComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(InsertableComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
