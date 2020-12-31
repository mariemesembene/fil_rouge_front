import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ListercompetencesComponent } from './listercompetences.component';

describe('ListercompetencesComponent', () => {
  let component: ListercompetencesComponent;
  let fixture: ComponentFixture<ListercompetencesComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ListercompetencesComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(ListercompetencesComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
