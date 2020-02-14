Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 71F2515E591
	for <lists+linux-watchdog@lfdr.de>; Fri, 14 Feb 2020 17:42:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405515AbgBNQmg (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 14 Feb 2020 11:42:36 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:55904 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405429AbgBNQWS (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 14 Feb 2020 11:22:18 -0500
Received: by mail-wm1-f65.google.com with SMTP id q9so10524554wmj.5
        for <linux-watchdog@vger.kernel.org>; Fri, 14 Feb 2020 08:22:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arista.com; s=googlenew;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uMByKESFF6nm9zU7UWxKm836eFhEE78GS/aSmv36ypo=;
        b=FEsP6b4PM8K2qgHByFNdjEpNN83Dy0kO3xo64FEZW/HbkCHfGWkwblq/rVxc68lo4m
         y2TZU7hRlS+LIdoDstsMPoUxOK/eD/qexwlcWEm08t906uNd4KFhYVCTFU9onCXSlV3G
         5Os73M6PIfRB6aC7ISLMBISqu6x9hErAy6WyBhFnOICVb95hCpeGkl17WpqHSDn5Tyhf
         +0YvtU6ArO+EK8f8bVRmqeWSG+AKwuVsa24KnR68y3OzT3Vkn+jv3Z+rkLdxOHnKkYnT
         QNACqSTbYh3FWt2UJKd4aECHPb0nvWIyadlzsJ5/X9BRkiJvidC0eMhpUSr4MxBovQbT
         FD5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uMByKESFF6nm9zU7UWxKm836eFhEE78GS/aSmv36ypo=;
        b=qMOP6wfb7UXc7nB4x2u+iOomj85xVjpebNiamAl+BA9KV5aLKQyu2NhuZ0L2CqyFxL
         IR+2sMLNqxv9+AABvaWtwDNA/6SSjD3Du4zUHmjeZG33kfrDV46gofcfqb5Hkth+HEbQ
         CV8ZeyXz4lV+vfDab3dI+OhGDhiG8/3n8WhzRFhrsHo+KyGUlvwWcdxwuz1nRGtPPiK8
         LjSwa6eHfapJOYAjsxagZ2r2hXSLZZNE2BC9fpQA74AxeyOhUDvkNUbJ4PdkLPvuGpk9
         8oVzjHCtyliJ6VBzRWGjz3ko0ycisZbtpxYKF1KTzrr0C22vkm8Tv6dLVWvXlSVcs74M
         vDPw==
X-Gm-Message-State: APjAAAWABGLk6UhG42GzART1bAQjKPBQy8paEGcgBHkgWuGyvfQCu/JZ
        98SfFTO0d58unCZ8Ak00WLkETA==
X-Google-Smtp-Source: APXvYqwd1BWya5wKyEDwJf/2EFU6deZJQYKlRpi3dDVo29Tsl6lLtugAnoYgXjnE13cW5icxKPKRqw==
X-Received: by 2002:a05:600c:248:: with SMTP id 8mr5421515wmj.1.1581697335728;
        Fri, 14 Feb 2020 08:22:15 -0800 (PST)
Received: from Mindolluin.ire.aristanetworks.com ([217.173.96.166])
        by smtp.gmail.com with ESMTPSA id p5sm7489433wrt.79.2020.02.14.08.22.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2020 08:22:15 -0800 (PST)
From:   Dmitry Safonov <dima@arista.com>
To:     linux-kernel@vger.kernel.org
Cc:     Dmitry Safonov <0x7f454c46@gmail.com>,
        Dmitry Safonov <dima@arista.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org
Subject: [PATCHv2] watchdog: Add stop_on_reboot parameter to control reboot policy
Date:   Fri, 14 Feb 2020 16:22:09 +0000
Message-Id: <20200214162209.129107-1-dima@arista.com>
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
Changes v1 => v2: Add module parameter instead of ioctl()

 drivers/watchdog/watchdog_core.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/watchdog/watchdog_core.c b/drivers/watchdog/watchdog_core.c
index 861daf4f37b2..5ead96199a0b 100644
--- a/drivers/watchdog/watchdog_core.c
+++ b/drivers/watchdog/watchdog_core.c
@@ -39,6 +39,10 @@
 
 static DEFINE_IDA(watchdog_ida);
 
+static int stop_on_reboot = -1;
+module_param(stop_on_reboot, int, 0644);
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

