import { Component, EventEmitter, Input, Output } from '@angular/core';

@Component({
  selector: 'app-contact',
  standalone: true,
  templateUrl: './contact.component.html',
  styleUrl: './contact.component.scss',
})
export class ContactComponent {
  @Input() name!: string;
  @Input() contact!: number;
  @Input() email!: string;
  @Input() city!: string;

  @Input() Obj1!: any;

  @Output() sendMsg = new EventEmitter<string>();

  sendMessage() {
    this.sendMsg.emit('Hello From Contact Component');
  }
}
