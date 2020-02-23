Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B2D3E169763
	for <lists+linux-watchdog@lfdr.de>; Sun, 23 Feb 2020 12:49:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725980AbgBWLto (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 23 Feb 2020 06:49:44 -0500
Received: from mail-ed1-f66.google.com ([209.85.208.66]:44408 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727391AbgBWLtn (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 23 Feb 2020 06:49:43 -0500
Received: by mail-ed1-f66.google.com with SMTP id g19so8360697eds.11
        for <linux-watchdog@vger.kernel.org>; Sun, 23 Feb 2020 03:49:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arista.com; s=googlenew;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HhQ3dLxQEyfhwpgG/2V7Ytlqomn7vI0cGazzgEuSPP4=;
        b=cjFMGUPWHpL5PPkyHsnZZp8nPNIIf6PV3J2w0KK0MP8ALMJLpyl2VwGYFZzmHmztFe
         2rMcbumUsJbphS9ZhoIAkKb3Qv1UfvDckpnHs2oS5H4ws5g6UhTiwzbL4nWGeVB5ztw3
         5Z6EaA9/t7KL4QwJ30yOz3TYyRir3LvW/U6bZNJE39tvtoR4g5kravOCeHhn4XwZzXmI
         XQHo+WbDK8Y+J9msu2AxjLCqypo5Jp+eccQaya6ruf0qBO1ndZxuR2iJzl9qnQ96Bw/H
         XpVP/tMnnKMQpQcWYv7IKJqF8TylPJtutxGvJ0zoI7O5RXNvU7UGZ4f9jtdfUtU2pjov
         dx1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HhQ3dLxQEyfhwpgG/2V7Ytlqomn7vI0cGazzgEuSPP4=;
        b=PqHOyI578gzXLQzTvxBTfq8z0SpqyJaDAcV+gqSob9gQkxHzFjX6d/MviEqBOtzQml
         EQ89yxwQbYD6splhX8dhpOmhyrP8aD1zrYS2C91tuG6BAgbrUddM0SrwpdVZF9iOWW7/
         1Ljc65AiM9IW8GfCNnrBnnvemeDbqJI5MkOu2UW+OF0EB8tmt9JI2dFdcj7utay0QU1Y
         36LVM7W4FKFbvSD9LVuTWEimVFs8wYzAED/LF8Jw1UHl6xDBmut6P0m608BnEG3MAF6+
         YsLmsmMDtRrBzzDKIy5ZwtUc8MBVkZoQly+1KsFgjREQmAw8TQxo1zAuCaWtINqHqXlO
         hIhA==
X-Gm-Message-State: APjAAAXTbJ1tKJpvHeSOok4q8udw1Mw9RJL9OEla4UFu+GI9oSiXWm9P
        aBUBGFl8oTUb+DrA7f5uXHk6uQ==
X-Google-Smtp-Source: APXvYqwzGpMCywapv/KxwqGPT90G4Og93tXFNsN7NA8LY36Ur3LZd8RUwnMTrBLigSli5ExMbM2z9g==
X-Received: by 2002:a05:6402:1044:: with SMTP id e4mr41838931edu.233.1582458581021;
        Sun, 23 Feb 2020 03:49:41 -0800 (PST)
Received: from localhost.localdomain ([2a02:8084:e84:2480:228:f8ff:fe6f:83a8])
        by smtp.gmail.com with ESMTPSA id i31sm786194edi.42.2020.02.23.03.49.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Feb 2020 03:49:40 -0800 (PST)
From:   Dmitry Safonov <dima@arista.com>
To:     linux-kernel@vger.kernel.org
Cc:     Dmitry Safonov <0x7f454c46@gmail.com>,
        Dmitry Safonov <dima@arista.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org
Subject: [PATCHv3] watchdog: Add stop_on_reboot parameter to control reboot policy
Date:   Sun, 23 Feb 2020 11:49:39 +0000
Message-Id: <20200223114939.194754-1-dima@arista.com>
X-Mailer: git-send-email 2.25.0
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

Provide new stop_on_reboot module parameter to let user control
watchdog's reboot policy.

Cc: Guenter Roeck <linux@roeck-us.net>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: linux-watchdog@vger.kernel.org
Signed-off-by: Dmitry Safonov <dima@arista.com>
---
Changes:
v3: Make module parameter read-only in runtime (Thanks Guenter for
    spotting the typo!)
v2: Add module parameter instead of ioctl()

 drivers/watchdog/watchdog_core.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/watchdog/watchdog_core.c b/drivers/watchdog/watchdog_core.c
index 861daf4f37b2..423844757812 100644
--- a/drivers/watchdog/watchdog_core.c
+++ b/drivers/watchdog/watchdog_core.c
@@ -39,6 +39,10 @@
 
 static DEFINE_IDA(watchdog_ida);
 
+static int stop_on_reboot = -1;
+module_param(stop_on_reboot, int, 0444);
+MODULE_PARM_DESC(stop_on_reboot, "Stop watchdogs on reboot (0=keep watching, 1=stop)");
+
 /*
  * Deferred Registration infrastructure.
  *
@@ -254,6 +258,14 @@ static int __watchdog_register_device(struct watchdog_device *wdd)
 		}
 	}
 
+	/* Module parameter to force watchdog policy on reboot. */
+	if (stop_on_reboot != -1) {
+		if (stop_on_reboot)
+			set_bit(WDOG_STOP_ON_REBOOT, &wdd->status);
+		else
+			clear_bit(WDOG_STOP_ON_REBOOT, &wdd->status);
+	}
+
 	if (test_bit(WDOG_STOP_ON_REBOOT, &wdd->status)) {
 		wdd->reboot_nb.notifier_call = watchdog_reboot_notifier;
 
-- 
2.25.0

