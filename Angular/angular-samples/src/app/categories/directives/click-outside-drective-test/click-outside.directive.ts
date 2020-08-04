import { Directive, ElementRef, EventEmitter, HostListener, Input, OnInit, Output } from '@angular/core';
import * as $ from 'jquery';


@Directive({
  selector: '[appClickOutside]'
})
export class ClickOutsideDirective implements OnInit {
  @Output() appClickOutside: EventEmitter<any> = new EventEmitter();
  @Input() clickOutsideIgnoreId: boolean = false;
  @Input() clickOutsideInactive: boolean = false;

  ngOnInit() {
    console.debug('Click outside directive: onInit');
  }

  @HostListener('window:click', ['$event'])
  @HostListener('window:touchstart', ['$event'])
  onClick(event) {
    if (!this.appClickOutside) return;
    const ignoreEl = this.clickOutsideIgnoreId;
    function isTargetOnIgnoredElement() {
      if (ignoreEl) {
        const foundEl = $(document).find(`#${ignoreEl}`)[0];
        return foundEl && (foundEl === event.target || foundEl.contains(event.target));
      }
      return false;
    }
    if (this.clickOutsideInactive||
      this.element.nativeElement === event.target ||
      this.element.nativeElement.contains(event.target) ||
      isTargetOnIgnoredElement()) {
        return;
      }
      event.preventDefault();
      this.appClickOutside.emit();
  }
  
  constructor(private element: ElementRef) {
    setTimeout(() => {
      console.info('delay done')
    }, 1000);
   } 

}
