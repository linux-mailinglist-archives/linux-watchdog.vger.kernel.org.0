Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 49101144211
	for <lists+linux-watchdog@lfdr.de>; Tue, 21 Jan 2020 17:22:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729276AbgAUQVy (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 21 Jan 2020 11:21:54 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:41179 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726555AbgAUQVy (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 21 Jan 2020 11:21:54 -0500
Received: by mail-wr1-f66.google.com with SMTP id c9so3902076wrw.8
        for <linux-watchdog@vger.kernel.org>; Tue, 21 Jan 2020 08:21:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arista.com; s=googlenew;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=c83oVOuqImIzXQyusYFsofs6lDjrmtrJIiJurwz27sw=;
        b=D8GxvoTMOQgJS2L0yLABhKKzcjx3RI9HH6JWxyE4P9nV1BwoWiO04bRfOtLMz1PODH
         seh04IQ7Pu60ulwxRjc6hyxFLo+gl7venIbx/pU66InLu/YulRjnaM3f7eEX7Fy54Ns7
         ZdoK//AeAw9yub5TEn43LjdLvdx4e5vX527mg0N8O+rch6zt+57C10obLivW5M51deIe
         WemzikzT3sJN3U3YocaDffFsY8rQH3rXYH+8+BFw141Mqc6tG9whYG3AqD4mwE6uWfU9
         tREaQ831UcAXG2HdSPysYm1YOXezVZQDZ0x42ukqAOCCdkPtPrjbNpSiVVys9MCjyKg9
         3/YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=c83oVOuqImIzXQyusYFsofs6lDjrmtrJIiJurwz27sw=;
        b=rVjJZLqO7dNxM/8fsN1sffo7q0vWFbJadhg9IyZf0i4mz2J6tkoILHqyy2ojIuRSzZ
         khoaMbz4XPHvVArBL/DkRWJphIro1Y7PWzg32F7lXZaBrLnnobii//c4ZgMQSAKsnf1b
         IXB+lN9LZ1WwjrpFPvnBzvo7ES9tBTmrd4Vrs4/iAacV+AYRRALCGpowDs3D/V4wKwD/
         CgXTV0b/kXYzzYq3Dk6wwuc2PbzLqIcA4ubYRYJw6x63sqe5GxvrrRBD0LxSz1/AOzqj
         +Cle7ux+hCEOzuNufEH0PiuhfT+k0iVd6H/rOZoC05mKUoxXXZQc4Nm0fh4MBpj8nwja
         qB2A==
X-Gm-Message-State: APjAAAVz1Xw3cIVeOTghvhv5Zvk2mQ3svko5ELAaD99/K6ysL46e4xGB
        vBdFfCajzdmvZdPhRvWI/9L+dA==
X-Google-Smtp-Source: APXvYqzv+PoYIaDtjKouci7MtJ3WSfyi/kOcDGlFoBlFJzHC+sxJytfWm0QSaIuHgif2iEMvCvR1sQ==
X-Received: by 2002:a5d:6b47:: with SMTP id x7mr6187916wrw.277.1579623712652;
        Tue, 21 Jan 2020 08:21:52 -0800 (PST)
Received: from Mindolluin.ire.aristanetworks.com ([217.173.96.166])
        by smtp.gmail.com with ESMTPSA id k8sm52454388wrl.3.2020.01.21.08.21.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jan 2020 08:21:51 -0800 (PST)
From:   Dmitry Safonov <dima@arista.com>
To:     linux-kernel@vger.kernel.org
Cc:     Dmitry Safonov <0x7f454c46@gmail.com>,
        Dmitry Safonov <dima@arista.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org
Subject: [RFC 1/2] watchdog: Check WDOG_STOP_ON_REBOOT in reboot notifier
Date:   Tue, 21 Jan 2020 16:21:44 +0000
Message-Id: <20200121162145.166334-2-dima@arista.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200121162145.166334-1-dima@arista.com>
References: <20200121162145.166334-1-dima@arista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Many watchdog drivers use watchdog_stop_on_reboot() helper in order
to stop the watchdog on system reboot. Unfortunately, this logic is
coded in driver's probe function and doesn't allows user to decide what
to do during shutdown/reboot.

On the other side, Xen and Qemu watchdog drivers (xen_wdt and i6300esb)
may be configured to either send NMI or turn off/reboot VM as
the watchdog action. As the kernel may stuck at any state, sending NMIs
can't reliably reboot the VM.

At Arista, we benefited from the following set-up: the emulated watchdogs
trigger VM reset and softdog is set to catch less severe conditions to
generate vmcore. Just before reboot watchdog's timeout is increased
to some good-enough value (3 mins). That keeps watchdog always running
and guarantees that VM doesn't stuck.

As a preparation to move the watchdog's decision to stop on reboot or
not in userspace, allow WDOG_STOP_ON_REBOOT to be set during runtime,
not only on driver's probing. Always register reboot notifier and check
WDOG_STOP_ON_REBOOT inside it (on actual reboot).

Signed-off-by: Dmitry Safonov <dima@arista.com>
---
 drivers/watchdog/watchdog_dev.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/watchdog/watchdog_dev.c b/drivers/watchdog/watchdog_dev.c
index 4b2a85438478..8766dd93028f 100644
--- a/drivers/watchdog/watchdog_dev.c
+++ b/drivers/watchdog/watchdog_dev.c
@@ -1103,6 +1103,10 @@ static int watchdog_reboot_notifier(struct notifier_block *nb,
 	struct watchdog_device *wdd;
 
 	wdd = container_of(nb, struct watchdog_device, reboot_nb);
+
+	if (!test_bit(WDOG_STOP_ON_REBOOT, &wdd->status))
+		return NOTIFY_DONE;
+
 	if (code == SYS_DOWN || code == SYS_HALT) {
 		if (watchdog_active(wdd)) {
 			int ret;
@@ -1139,16 +1143,13 @@ int watchdog_dev_register(struct watchdog_device *wdd)
 		return ret;
 	}
 
-	if (test_bit(WDOG_STOP_ON_REBOOT, &wdd->status)) {
-		wdd->reboot_nb.notifier_call = watchdog_reboot_notifier;
+	wdd->reboot_nb.notifier_call = watchdog_reboot_notifier;
 
-		ret = devm_register_reboot_notifier(&wdd->wd_data->dev,
-						    &wdd->reboot_nb);
-		if (ret) {
-			pr_err("watchdog%d: Cannot register reboot notifier (%d)\n",
-			       wdd->id, ret);
-			watchdog_dev_unregister(wdd);
-		}
+	ret = devm_register_reboot_notifier(&wdd->wd_data->dev, &wdd->reboot_nb);
+	if (ret) {
+		pr_err("watchdog%d: Cannot register reboot notifier (%d)\n",
+				wdd->id, ret);
+		watchdog_dev_unregister(wdd);
 	}
 
 	return ret;
-- 
2.25.0

