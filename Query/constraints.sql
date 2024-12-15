-- add constraint foreign key for employee
use portmanagement;
ALTER TABLE employee
    ADD CONSTRAINT employee_task_fk FOREIGN KEY (TaskID) REFERENCES task(TaskID)
        ON DELETE RESTRICT
        ON UPDATE CASCADE;


-- add constraint foreign key for dock
ALTER TABLE dock
    ADD CONSTRAINT dock_port_fk FOREIGN KEY (PortID) REFERENCES port(PortID)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,

    ADD CONSTRAINT dock_employee_fk FOREIGN KEY (DockManagerID) REFERENCES employee(EmployeeID)
        ON DELETE RESTRICT
        ON UPDATE CASCADE;


-- add constraint foreign key for dockship
ALTER TABLE dockship
    ADD CONSTRAINT dockship_ship_fk FOREIGN KEY (ShipID) REFERENCES ship(ShipID)
    ON DELETE RESTRICT
       ON UPDATE CASCADE,

    ADD CONSTRAINT dockship_dock_fk FOREIGN KEY (DockID) REFERENCES dock(DockID)
        ON DELETE RESTRICT
        ON UPDATE CASCADE;


-- add constraint foreign key for warehouse
ALTER TABLE warehouse
    ADD CONSTRAINT warehouse_port_fk FOREIGN KEY (PortID) REFERENCES port(PortID)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,

    ADD CONSTRAINT warehouse_employee_fk FOREIGN KEY (WarehouseManagerID) REFERENCES employee(EmployeeID)
        ON DELETE RESTRICT
        ON UPDATE CASCADE;


-- add constraint foreign key for port
ALTER TABLE port
    ADD CONSTRAINT port_employee_fk FOREIGN KEY (PortManagerID) REFERENCES employee(EmployeeID)
        ON DELETE RESTRICT
        ON UPDATE CASCADE;


-- add constraint foreign key for container
ALTER TABLE container
    ADD CONSTRAINT container_ship_fk FOREIGN KEY (ShipID) REFERENCES ship(ShipID)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,

    ADD CONSTRAINT container_warehouse_ship FOREIGN KEY (WarehouseID) REFERENCES warehouse(WarehouseID)
        ON DELETE RESTRICT
        ON UPDATE CASCADE;


-- add constraint foreign key for containergoods
ALTER TABLE containergoods
    ADD CONSTRAINT containergoods_container_fk FOREIGN KEY (ContainerID) REFERENCES container(ContainerID)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,

    ADD CONSTRAINT containergoods_goods_fk FOREIGN KEY (GoodsID) REFERENCES goods(GoodsID)
        ON DELETE RESTRICT
        ON UPDATE CASCADE;


-- add constraint foreign key for goodsinvoice
ALTER TABLE goodsinvoice
    ADD CONSTRAINT goodsinvoice_goods_fk FOREIGN KEY (GoodsID) REFERENCES goods(GoodsID)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,

    ADD CONSTRAINT goodsinvoice_invoice_fk FOREIGN KEY (InvoiceID) REFERENCES invoice(InvoiceID)
        ON DELETE RESTRICT
        ON UPDATE CASCADE;

-- add constraint foreign key for invoice
ALTER TABLE invoice
    ADD CONSTRAINT invoice_customer_fk FOREIGN KEY (CustomerID) REFERENCES customer(CustomerID)
        ON DELETE RESTRICT
        ON UPDATE CASCADE;
