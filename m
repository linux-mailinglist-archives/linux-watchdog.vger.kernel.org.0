Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4BEAB15C9D3
	for <lists+linux-watchdog@lfdr.de>; Thu, 13 Feb 2020 19:00:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727906AbgBMSAJ (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 13 Feb 2020 13:00:09 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:55102 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727594AbgBMSAH (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 13 Feb 2020 13:00:07 -0500
Received: by mail-wm1-f67.google.com with SMTP id g1so7255394wmh.4
        for <linux-watchdog@vger.kernel.org>; Thu, 13 Feb 2020 10:00:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arista.com; s=googlenew;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yW0jgXQz7fRClRh+H+UBu4xpGoCVJNVpLNtJDmiQHCo=;
        b=leHI3ZAnR0hc1CPEh523zBYIvdhDhGl+lUf9k+14RWWhuDXSIireK2PDjHb65FvML1
         ptuRaVvfpP0ukdogPOTE41+jwKEoZYKTOZ4l1VtM51bYmXT5Wd391SU2O1EeOphuTH1Q
         nOcM6yO5WGVyDFx3PCgW3l66xUwCfL6fygjLF/8umf903UcJi8wCfVvaQfBF3jcIlg/L
         08NbS6w4i+irgZeRQEN7jVh6rOWvTa+4NPcgeZ+NKYscwCWySrC2A6WuzL+WXkq4BQwk
         ho8wFD3GNgIJ4fVODC3SKHmMRFMpoT/Mk8+mql/ZP78rDo8XiadSzmKPJzDEaiE7kPff
         I5fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yW0jgXQz7fRClRh+H+UBu4xpGoCVJNVpLNtJDmiQHCo=;
        b=FhKCEDpdJKWdDk1Wt3k3ZOqyg7TIGlN3dDe22MGqGQpzwjY6WU6uswBLHZw7FZClLK
         kEZO4sooalvlpoiottZ3VlcD9PtLLL0P21WJD8jGoEhBxrh7w1U6ZtAldq54COJEf5QR
         SO8fzllU012N7GNsAWLLhf0qH9BTnURodPBET4VRSscSeIG+6P09whEeXdVJGbpqYjvp
         8VheVhmFmLjpPYn4QYzmXCvAD4DOOxBA8UGHXF62J1EcqfW9PqXDtnCyKiLmAMhswcik
         YduqrMmsIjc45RVFWTuIKzh/7xrX+MoXZR+sf+rf13lGReMO0VhcjoOKsMx9ESAhxuJJ
         Q80w==
X-Gm-Message-State: APjAAAWHn/TuN0cEaawPUVpw1sog2fmuhkzHn/dujflvrz1oB/nLfpFS
        29zebRt3veDJ79X8TjMyQPo6QQ==
X-Google-Smtp-Source: APXvYqyE3jb4mWwz79E0W8X+lrylXGFOk5ZjRVEQzAqMjPyr15hrfMPtVV5AqWvMPvY+9GQ49Fk3eA==
X-Received: by 2002:a05:600c:2187:: with SMTP id e7mr6898896wme.11.1581616805696;
        Thu, 13 Feb 2020 10:00:05 -0800 (PST)
Received: from Mindolluin.ire.aristanetworks.com ([217.173.96.166])
        by smtp.gmail.com with ESMTPSA id z11sm3630089wrv.96.2020.02.13.10.00.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2020 10:00:05 -0800 (PST)
From:   Dmitry Safonov <dima@arista.com>
To:     linux-kernel@vger.kernel.org
Cc:     Dmitry Safonov <0x7f454c46@gmail.com>,
        Dmitry Safonov <dima@arista.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org
Subject: [PATCH 1/2] watchdog: Check WDOG_STOP_ON_REBOOT in reboot notifier
Date:   Thu, 13 Feb 2020 17:59:57 +0000
Message-Id: <20200213175958.105914-2-dima@arista.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200213175958.105914-1-dima@arista.com>
References: <20200213175958.105914-1-dima@arista.com>
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
 drivers/watchdog/watchdog_core.c | 27 +++++++++++++--------------
 1 file changed, 13 insertions(+), 14 deletions(-)

diff --git a/drivers/watchdog/watchdog_core.c b/drivers/watchdog/watchdog_core.c
index 861daf4f37b2..ebf80ff3e8ce 100644
--- a/drivers/watchdog/watchdog_core.c
+++ b/drivers/watchdog/watchdog_core.c
@@ -153,6 +153,10 @@ static int watchdog_reboot_notifier(struct notifier_block *nb,
 	struct watchdog_device *wdd;
 
 	wdd = container_of(nb, struct watchdog_device, reboot_nb);
+
+	if (!test_bit(WDOG_STOP_ON_REBOOT, &wdd->status))
+		return NOTIFY_DONE;
+
 	if (code == SYS_DOWN || code == SYS_HALT) {
 		if (watchdog_active(wdd)) {
 			int ret;
@@ -254,17 +258,14 @@ static int __watchdog_register_device(struct watchdog_device *wdd)
 		}
 	}
 
-	if (test_bit(WDOG_STOP_ON_REBOOT, &wdd->status)) {
-		wdd->reboot_nb.notifier_call = watchdog_reboot_notifier;
-
-		ret = register_reboot_notifier(&wdd->reboot_nb);
-		if (ret) {
-			pr_err("watchdog%d: Cannot register reboot notifier (%d)\n",
-			       wdd->id, ret);
-			watchdog_dev_unregister(wdd);
-			ida_simple_remove(&watchdog_ida, id);
-			return ret;
-		}
+	wdd->reboot_nb.notifier_call = watchdog_reboot_notifier;
+	ret = register_reboot_notifier(&wdd->reboot_nb);
+	if (ret) {
+		pr_err("watchdog%d: Cannot register reboot notifier (%d)\n",
+				wdd->id, ret);
+		watchdog_dev_unregister(wdd);
+		ida_simple_remove(&watchdog_ida, id);
+		return ret;
 	}
 
 	if (wdd->ops->restart) {
@@ -321,9 +322,7 @@ static void __watchdog_unregister_device(struct watchdog_device *wdd)
 	if (wdd->ops->restart)
 		unregister_restart_handler(&wdd->restart_nb);
 
-	if (test_bit(WDOG_STOP_ON_REBOOT, &wdd->status))
-		unregister_reboot_notifier(&wdd->reboot_nb);
-
+	unregister_reboot_notifier(&wdd->reboot_nb);
 	watchdog_dev_unregister(wdd);
 	ida_simple_remove(&watchdog_ida, wdd->id);
 }
-- 
2.25.0

