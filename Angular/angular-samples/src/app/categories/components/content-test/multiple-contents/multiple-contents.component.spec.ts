import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { MultipleContentsComponent } from './multiple-contents.component';

describe('MultipleContentsComponent', () => {
  let component: MultipleContentsComponent;
  let fixture: ComponentFixture<MultipleContentsComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ MultipleContentsComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(MultipleContentsComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
