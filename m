Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B330FCF407
	for <lists+linux-watchdog@lfdr.de>; Tue,  8 Oct 2019 09:36:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730167AbfJHHg6 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 8 Oct 2019 03:36:58 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:44647 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729740AbfJHHg5 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 8 Oct 2019 03:36:57 -0400
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue106 [212.227.15.145]) with ESMTPA (Nemesis) id
 1M9W78-1iCDjs0OqS-005VR9; Tue, 08 Oct 2019 09:36:36 +0200
From:   Arnd Bergmann <arnd@arndb.de>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     Arnd Bergmann <arnd@arndb.de>, linux-watchdog@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] watchdog: cpwd: fix build regression
Date:   Tue,  8 Oct 2019 09:36:16 +0200
Message-Id: <20191008073634.290255-1-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:e0lTh4PYIS+uOwLuEcT+6SHvLxiPJVb0x3syccCvfXdySprRihH
 qEApwBNgPs+3ElpfxURB1l+2SkpYZBzguc9t/iIdh765204J1l61APY5bO6/SORe0kenS26
 LsZENXIen+9F1wEDEhyLYG0de6gqaq1/s8vGQ48OmnqHs+DPZ5GZYKV2KygqKckQ5hw9IV8
 sn5eQyWj8nvzSoxnt3C4A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:WiFGJjr5i6k=:FtjrVF5t6utKSO7CsTSnCd
 4l2xCl0MSd2jjdiJqEVcObg8c0JhZnWJxaocwfZPUmt3AJCjY2Nk8YIlhunZ/IAQj784BlBEj
 egp0w2fA6NYSGNzEUvVIy9AW1d1KLGuUP1hUN8eD64PSIr8SULsQ4KyxTPnv642RuctQO46Kj
 NVB3YNRO553/D7ot42tbPo/zs027WcqljgJUDsZ0q2IGEWd2+chgAjVT9sgTzCy88S4Nxnuiv
 Ar+Ipt/e0x1j9DBcTk//BqUzz5n9yz26/9n1nxsdjwcuD3s50kpzdJpu1YLE85qt/fbycmWM2
 dTWj4CGrXf4dIk+3cYVJ4TWJcOh5rGzt5n7pNDgvoIfr9yg2rZnejtHXFZahLalR8sfAou9Qm
 GsZaU8sb24ndkTOkb7wbIP0w3wSIFxWsLGOGHAlTUDIOWeY8yY+AUHb3qPy84DisSToXdVwIu
 GCxuEvlkBOwvUg0ERthxan4MFHqvEg3TDQys5/3KiUZ0/+qvVGwNV3aOEYjnwLUzPAaeaJl7t
 t5XM+GG+LqDva7z3ZsBOsT9JBntiB3gfy8L6l1j8o6OP3A99hH9zNBnv0bVJjTYeqn10HznH2
 Xdm0NRLSbw+EsONin+hJEI2MmetjnEqv3ushgvDzcSnKvanplZFH5Yotbe14P5jDWZCc0GJLy
 f4KG0ekCBYKnCt15StYAEx1EbCxAAVtCj5Bix5q4PfGzEApp5O4uplas4V+wrMtEZH/nydrCW
 rCMLgp1SqBdmn9Qrc5JKRK5pIN/Kfrrm4ERf8kAV9mMvBkAvWP2d2h+J40GrAO38+S60NYEQF
 6zC8gIgxZa23e7p2eHmQktY2hIKVBAeg/oRFxqVNtXodqf1mY8IhtiSE06pcZbqFKcYOx6kWx
 QjtaA8O5imqxS1Uuxkng==
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

The compat_ptr_ioctl() infrastructure did not make it into
linux-5.4, so cpwd now fails to build.

Fix it by using an open-coded version.

Fixes: 68f28b01fb9e ("watchdog: cpwd: use generic compat_ptr_ioctl")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/watchdog/cpwd.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/watchdog/cpwd.c b/drivers/watchdog/cpwd.c
index 9393be584e72..808eeb4779e4 100644
--- a/drivers/watchdog/cpwd.c
+++ b/drivers/watchdog/cpwd.c
@@ -26,6 +26,7 @@
 #include <linux/interrupt.h>
 #include <linux/ioport.h>
 #include <linux/timer.h>
+#include <linux/compat.h>
 #include <linux/slab.h>
 #include <linux/mutex.h>
 #include <linux/io.h>
@@ -473,6 +474,11 @@ static long cpwd_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 	return 0;
 }
 
+static long cpwd_compat_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
+{
+	return cpwd_ioctl(file, cmd, (unsigned long)compat_ptr(arg));
+}
+
 static ssize_t cpwd_write(struct file *file, const char __user *buf,
 			  size_t count, loff_t *ppos)
 {
@@ -497,7 +503,7 @@ static ssize_t cpwd_read(struct file *file, char __user *buffer,
 static const struct file_operations cpwd_fops = {
 	.owner =		THIS_MODULE,
 	.unlocked_ioctl =	cpwd_ioctl,
-	.compat_ioctl =		compat_ptr_ioctl,
+	.compat_ioctl =		cpwd_compat_ioctl,
 	.open =			cpwd_open,
 	.write =		cpwd_write,
 	.read =			cpwd_read,
-- 
2.20.0

