import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ListerreferentielsComponent } from './listerreferentiels.component';

describe('ListerreferentielsComponent', () => {
  let component: ListerreferentielsComponent;
  let fixture: ComponentFixture<ListerreferentielsComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ListerreferentielsComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(ListerreferentielsComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
