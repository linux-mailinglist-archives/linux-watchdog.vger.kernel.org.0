Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BC762134253
	for <lists+linux-watchdog@lfdr.de>; Wed,  8 Jan 2020 13:54:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726902AbgAHMyO (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 8 Jan 2020 07:54:14 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:39265 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727304AbgAHMyL (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 8 Jan 2020 07:54:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1578488049;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=+gcKZ6MhcBEiXq2WwzLzzuxx2MKHjtaktZcdoemM0CI=;
        b=PZOWZm4VrWoYZ0cxcJ2khjqlQ08sBebmQBVbrFJSbJLiDMX3JJya4l0n8dIm1mjA7OXbdX
        t7O3uu/ucTAlNtnEcO8mXmKL3BTDbihlbOteoF54XHfUpGckR9P8tV5LNwg1b/3+9zCkak
        NP7ia+ELYcGd1avAVDFXkjAd9SaJDGg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-430-1wcoVsHpPrO2MtTI_0xWEw-1; Wed, 08 Jan 2020 07:54:06 -0500
X-MC-Unique: 1wcoVsHpPrO2MtTI_0xWEw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8D31A18CA240;
        Wed,  8 Jan 2020 12:54:04 +0000 (UTC)
Received: from rules.brq.redhat.com (unknown [10.43.2.123])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 408817FB78;
        Wed,  8 Jan 2020 12:54:02 +0000 (UTC)
From:   Vladis Dronov <vdronov@redhat.com>
To:     linux-watchdog@vger.kernel.org
Cc:     Andrey Smirnov <andrew.smirnov@gmail.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-kernel@vger.kernel.org, cphealy@gmail.com,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Andrew Morton <akpm@linux-foundation.org>, vdronov@redhat.com
Subject: [PATCH] watchdog: fix UAF in reboot notifier handling in watchdog core code
Date:   Wed,  8 Jan 2020 13:53:47 +0100
Message-Id: <20200108125347.6067-1-vdronov@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Content-Transfer-Encoding: quoted-printable
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

After the commit 44ea39420fc9 ("drivers/watchdog: make use of
devm_register_reboot_notifier()") the struct notifier_block reboot_nb in
the struct watchdog_device is removed from the reboot notifiers chain at
the time watchdog's chardev is closed. But at least in i6300esb.c case
reboot_nb is embedded in the struct esb_dev which can be freed on its
device removal and before the chardev is closed, thus UAF at reboot:

[    7.728581] esb_probe: esb_dev.watchdog_device ffff91316f91ab28
ts# uname -r                            note the address ^^^
5.5.0-rc5-ae6088-wdog
ts# ./openwdog0 &
[1] 696
ts# opened /dev/watchdog0, sleeping 10s...
ts# echo 1 > /sys/devices/pci0000\:00/0000\:00\:09.0/remove
[  178.086079] devres:rel_nodes: dev ffff91317668a0b0 data ffff91316f91ab=
28
           esb_dev.watchdog_device.reboot_nb memory is freed here ^^^
ts# ...woken up
[  181.459010] devres:rel_nodes: dev ffff913171781000 data ffff913174a1da=
e8
[  181.460195] devm_unreg_reboot_notifier: res ffff913174a1dae8 nb ffff91=
316f91ab78
                                     attempt to use memory already freed =
^^^
[  181.461063] devm_unreg_reboot_notifier: nb->call 6b6b6b6b6b6b6b6b
[  181.461243] devm_unreg_reboot_notifier: nb->next 6b6b6b6b6b6b6b6b
                freed memory is filled with a slub poison ^^^
[1]+  Done                    ./openwdog0
ts# reboot
[  229.921862] systemd-shutdown[1]: Rebooting.
[  229.939265] notifier_call_chain: nb ffffffff9c6c2f20 nb->next ffffffff=
9c6d50c0
[  229.943080] notifier_call_chain: nb ffffffff9c6d50c0 nb->next 6b6b6b6b=
6b6b6b6b
[  229.946054] notifier_call_chain: nb 6b6b6b6b6b6b6b6b INVAL
[  229.957584] general protection fault: 0000 [#1] SMP
[  229.958770] CPU: 0 PID: 1 Comm: systemd-shutdow Not tainted 5.5.0-rc5-=
ae6088-wdog
[  229.960224] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), ...
[  229.963288] RIP: 0010:notifier_call_chain+0x66/0xd0
[  229.969082] RSP: 0018:ffffb20dc0013d88 EFLAGS: 00010246
[  229.970812] RAX: 000000000000002e RBX: 6b6b6b6b6b6b6b6b RCX: 000000000=
00008b3
[  229.972929] RDX: 0000000000000000 RSI: 0000000000000096 RDI: ffffffff9=
ccc46ac
[  229.975028] RBP: 0000000000000001 R08: 0000000000000000 R09: 000000000=
00008b3
[  229.977039] R10: 0000000000000001 R11: ffffffff9c26c740 R12: 000000000=
0000000
[  229.979155] R13: 6b6b6b6b6b6b6b6b R14: 0000000000000000 R15: 00000000f=
ffffffa
...   slub_debug=3DFZP poison ^^^
[  229.989089] Call Trace:
[  229.990157]  blocking_notifier_call_chain+0x43/0x59
[  229.991401]  kernel_restart_prepare+0x14/0x30
[  229.992607]  kernel_restart+0x9/0x30
[  229.993800]  __do_sys_reboot+0x1d2/0x210
[  230.000149]  do_syscall_64+0x3d/0x130
[  230.001277]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[  230.002639] RIP: 0033:0x7f5461bdd177
[  230.016402] Modules linked in: i6300esb
[  230.050261] Kernel panic - not syncing: Attempted to kill init! exitco=
de=3D0x0000000b

Fix the crash by reverting 44ea39420fc9 so unregister_reboot_notifier()
is called when watchdog device is removed. This also makes handling of
the reboot notifier unified with the handling of the restart handler,
which is freed with unregister_restart_handler() in the same place.

Fixes: 44ea39420fc9 ("drivers/watchdog: make use of devm_register_reboot_=
notifier()")
Cc: stable@vger.kernel.org # v4.15+
Signed-off-by: Vladis Dronov <vdronov@redhat.com>
---
 drivers/watchdog/watchdog_core.c | 35 +++++++++++++++++++++++++++++++
 drivers/watchdog/watchdog_dev.c  | 36 +-------------------------------
 2 files changed, 36 insertions(+), 35 deletions(-)

diff --git a/drivers/watchdog/watchdog_core.c b/drivers/watchdog/watchdog=
_core.c
index 21e8085b848b..861daf4f37b2 100644
--- a/drivers/watchdog/watchdog_core.c
+++ b/drivers/watchdog/watchdog_core.c
@@ -147,6 +147,25 @@ int watchdog_init_timeout(struct watchdog_device *wd=
d,
 }
 EXPORT_SYMBOL_GPL(watchdog_init_timeout);
=20
+static int watchdog_reboot_notifier(struct notifier_block *nb,
+				    unsigned long code, void *data)
+{
+	struct watchdog_device *wdd;
+
+	wdd =3D container_of(nb, struct watchdog_device, reboot_nb);
+	if (code =3D=3D SYS_DOWN || code =3D=3D SYS_HALT) {
+		if (watchdog_active(wdd)) {
+			int ret;
+
+			ret =3D wdd->ops->stop(wdd);
+			if (ret)
+				return NOTIFY_BAD;
+		}
+	}
+
+	return NOTIFY_DONE;
+}
+
 static int watchdog_restart_notifier(struct notifier_block *nb,
 				     unsigned long action, void *data)
 {
@@ -235,6 +254,19 @@ static int __watchdog_register_device(struct watchdo=
g_device *wdd)
 		}
 	}
=20
+	if (test_bit(WDOG_STOP_ON_REBOOT, &wdd->status)) {
+		wdd->reboot_nb.notifier_call =3D watchdog_reboot_notifier;
+
+		ret =3D register_reboot_notifier(&wdd->reboot_nb);
+		if (ret) {
+			pr_err("watchdog%d: Cannot register reboot notifier (%d)\n",
+			       wdd->id, ret);
+			watchdog_dev_unregister(wdd);
+			ida_simple_remove(&watchdog_ida, id);
+			return ret;
+		}
+	}
+
 	if (wdd->ops->restart) {
 		wdd->restart_nb.notifier_call =3D watchdog_restart_notifier;
=20
@@ -289,6 +321,9 @@ static void __watchdog_unregister_device(struct watch=
dog_device *wdd)
 	if (wdd->ops->restart)
 		unregister_restart_handler(&wdd->restart_nb);
=20
+	if (test_bit(WDOG_STOP_ON_REBOOT, &wdd->status))
+		unregister_reboot_notifier(&wdd->reboot_nb);
+
 	watchdog_dev_unregister(wdd);
 	ida_simple_remove(&watchdog_ida, wdd->id);
 }
diff --git a/drivers/watchdog/watchdog_dev.c b/drivers/watchdog/watchdog_=
dev.c
index 4b2a85438478..8b5c742f24e8 100644
--- a/drivers/watchdog/watchdog_dev.c
+++ b/drivers/watchdog/watchdog_dev.c
@@ -38,7 +38,6 @@
 #include <linux/miscdevice.h>	/* For handling misc devices */
 #include <linux/module.h>	/* For module stuff/... */
 #include <linux/mutex.h>	/* For mutexes */
-#include <linux/reboot.h>	/* For reboot notifier */
 #include <linux/slab.h>		/* For memory functions */
 #include <linux/types.h>	/* For standard types (like size_t) */
 #include <linux/watchdog.h>	/* For watchdog specific items */
@@ -1097,25 +1096,6 @@ static void watchdog_cdev_unregister(struct watchd=
og_device *wdd)
 	put_device(&wd_data->dev);
 }
=20
-static int watchdog_reboot_notifier(struct notifier_block *nb,
-				    unsigned long code, void *data)
-{
-	struct watchdog_device *wdd;
-
-	wdd =3D container_of(nb, struct watchdog_device, reboot_nb);
-	if (code =3D=3D SYS_DOWN || code =3D=3D SYS_HALT) {
-		if (watchdog_active(wdd)) {
-			int ret;
-
-			ret =3D wdd->ops->stop(wdd);
-			if (ret)
-				return NOTIFY_BAD;
-		}
-	}
-
-	return NOTIFY_DONE;
-}
-
 /*
  *	watchdog_dev_register: register a watchdog device
  *	@wdd: watchdog device
@@ -1134,22 +1114,8 @@ int watchdog_dev_register(struct watchdog_device *=
wdd)
 		return ret;
=20
 	ret =3D watchdog_register_pretimeout(wdd);
-	if (ret) {
+	if (ret)
 		watchdog_cdev_unregister(wdd);
-		return ret;
-	}
-
-	if (test_bit(WDOG_STOP_ON_REBOOT, &wdd->status)) {
-		wdd->reboot_nb.notifier_call =3D watchdog_reboot_notifier;
-
-		ret =3D devm_register_reboot_notifier(&wdd->wd_data->dev,
-						    &wdd->reboot_nb);
-		if (ret) {
-			pr_err("watchdog%d: Cannot register reboot notifier (%d)\n",
-			       wdd->id, ret);
-			watchdog_dev_unregister(wdd);
-		}
-	}
=20
 	return ret;
 }
--=20
2.20.1

