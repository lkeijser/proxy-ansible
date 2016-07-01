resource r0 {
        device /dev/drbd0;
        disk /dev/vdb1;
        meta-disk internal;
        on drbd1 {
                address 10.70.35.69:7788;
        }
        on drbd2 {
                address 10.70.35.70:7788;
        }
        syncer {
                rate 10M;
        }
}
