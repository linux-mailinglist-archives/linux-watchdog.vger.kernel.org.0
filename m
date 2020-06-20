Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 717A32025BD
	for <lists+linux-watchdog@lfdr.de>; Sat, 20 Jun 2020 19:50:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728376AbgFTRuS (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 20 Jun 2020 13:50:18 -0400
Received: from mail-oo1-f67.google.com ([209.85.161.67]:45016 "EHLO
        mail-oo1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728369AbgFTRuR (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 20 Jun 2020 13:50:17 -0400
Received: by mail-oo1-f67.google.com with SMTP id e8so2541940ooi.11
        for <linux-watchdog@vger.kernel.org>; Sat, 20 Jun 2020 10:50:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=HsaXFJFfQTpkc7VsM0wDRnmHbxrLz37kqFWylfZRzzM=;
        b=jT6Bbt0Ek2xHqLGMOWoYZsGqvN6b8e9X2DImY+3pet48uuzTvYP+Yj/mcHHM/mC9pZ
         xchlRTJLcaBooCkOsr94JPbCUlDz2gRr64qBI1yIRPU1Y2s+wquLVOcLU4sR6EhWpFKs
         kD6KMM+UJc+WNZmhjEEJEbMmawKOtosKcUpjrk2Ic0tnaKNP4Sf/eJ6LYoduY1PooQp2
         jLfDKEf+tapJU4r/1mZk70ilqHiubEHq3EpkSIGCVy3ohzLopgAS/uPsbUrsOihAVgmI
         C35JG/ul95L6qH9cPdjZpvXCYYftWtfpspRAShpnHHWui++RJqW/3eKbWFVF/jIu5py7
         QM9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=HsaXFJFfQTpkc7VsM0wDRnmHbxrLz37kqFWylfZRzzM=;
        b=KPglsWurHK5tfXoab+6rVfOYWUKYAt/CTWiKRe7sVoqbk2/wUbuA3qZ7D9T2mWZLyB
         28rZe4uLZhpnw6wtHNjHaqapD3jDiqWNzttjxmMV6/krAXMUZ8AJ6cvPSbooTXqKc4dp
         YcIepPiiOnbNEHYBHhclblW/R9Goh1LacUVNhQJLaiizA7P9kn6gfQ/Yy9gGL97himIW
         Yne6o/FagtDF56nqeGJo2+8gWzca/OzLZMdtH6VThrZtSSnP8C/5VDMQWo6OI6IYyN8I
         EuO582NdoX57ZxV/I7q7kX+0o/ywLY0mvVL3+KPW4JHgNg+398RIQXwJuLfdxnmtfx28
         B66g==
X-Gm-Message-State: AOAM533RcBhkmh448YTQMXKJJLDcDyi2bKs4RdUkze/ahzQ3Db7srV+1
        HUrbNpL+Sa+x5fErCQWMXA==
X-Google-Smtp-Source: ABdhPJy3d1wuDeFjdp7oZk+5cCDDlakTQLgbG2oIH27O9d/D+zmje+jdbS/X+wqbKonwA+n7O+C7cw==
X-Received: by 2002:a4a:4c8e:: with SMTP id a136mr8166914oob.23.1592675356330;
        Sat, 20 Jun 2020 10:49:16 -0700 (PDT)
Received: from serve.minyard.net (serve.minyard.net. [2001:470:b8f6:1b::1])
        by smtp.gmail.com with ESMTPSA id e19sm826452otq.29.2020.06.20.10.49.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jun 2020 10:49:14 -0700 (PDT)
Received: from t560.minyard.net (unknown [IPv6:2001:470:b8f6:1b:98f8:1e34:b5b7:82f7])
        by serve.minyard.net (Postfix) with ESMTPA id F0AC9180564;
        Sat, 20 Jun 2020 17:49:11 +0000 (UTC)
From:   minyard@acm.org
To:     Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>
Cc:     linux-watchdog@vger.kernel.org, Corey Minyard <cminyard@mvista.com>
Subject: [PATCH 08/10] watchdog: Add a way to extend the timeout on a reboot
Date:   Sat, 20 Jun 2020 12:49:05 -0500
Message-Id: <20200620174907.20229-9-minyard@acm.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200620174907.20229-1-minyard@acm.org>
References: <20200620174907.20229-1-minyard@acm.org>
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

From: Corey Minyard <cminyard@mvista.com>

If reboot_timeout is set in the watchdog device struct, set the timeout
to that value on a reboot.  This way more time can be given for a reboot
to complete.

Signed-off-by: Corey Minyard <cminyard@mvista.com>
---
 drivers/watchdog/watchdog_core.c | 2 ++
 include/linux/watchdog.h         | 4 ++++
 2 files changed, 6 insertions(+)

diff --git a/drivers/watchdog/watchdog_core.c b/drivers/watchdog/watchdog_core.c
index 03943a34e9fb..5792f9bca645 100644
--- a/drivers/watchdog/watchdog_core.c
+++ b/drivers/watchdog/watchdog_core.c
@@ -165,6 +165,8 @@ static int watchdog_reboot_notifier(struct notifier_block *nb,
 			if (ret)
 				return NOTIFY_BAD;
 		}
+	} else if (wdd->reboot_timeout) {
+		watchdog_set_timeout(wdd, wdd->reboot_timeout);
 	}
 
 	return NOTIFY_DONE;
diff --git a/include/linux/watchdog.h b/include/linux/watchdog.h
index 1eefae61215d..0fb57f29346c 100644
--- a/include/linux/watchdog.h
+++ b/include/linux/watchdog.h
@@ -92,6 +92,9 @@ struct watchdog_ops {
  * @status:	Field that contains the devices internal status bits.
  * @deferred:	Entry in wtd_deferred_reg_list which is used to
  *		register early initialized watchdogs.
+ * @reboot_timeout:
+ *		If non-zero, the timeout will be set to this value
+ *		on a reboot.  This lets a reboot be given more time.
  *
  * The watchdog_device structure contains all information about a
  * watchdog timer device.
@@ -125,6 +128,7 @@ struct watchdog_device {
 #define WDOG_HW_RUNNING		3	/* True if HW watchdog running */
 #define WDOG_STOP_ON_UNREGISTER	4	/* Should be stopped on unregister */
 	struct list_head deferred;
+	unsigned int reboot_timeout;
 };
 
 #define WATCHDOG_NOWAYOUT		IS_BUILTIN(CONFIG_WATCHDOG_NOWAYOUT)
-- 
2.17.1

