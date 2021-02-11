import { ComponentFixture, TestBed } from '@angular/core/testing';

import { PutprofilsortieComponent } from './putprofilsortie.component';

describe('PutprofilsortieComponent', () => {
  let component: PutprofilsortieComponent;
  let fixture: ComponentFixture<PutprofilsortieComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ PutprofilsortieComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(PutprofilsortieComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
