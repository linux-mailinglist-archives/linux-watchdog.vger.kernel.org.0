Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 83062F0029
	for <lists+linux-watchdog@lfdr.de>; Tue,  5 Nov 2019 15:45:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389542AbfKEOpK (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 5 Nov 2019 09:45:10 -0500
Received: from Galois.linutronix.de ([193.142.43.55]:41565 "EHLO
        Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389096AbfKEOpK (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 5 Nov 2019 09:45:10 -0500
Received: from bigeasy by Galois.linutronix.de with local (Exim 4.80)
        (envelope-from <bigeasy@linutronix.de>)
        id 1iS04w-0005tZ-TS; Tue, 05 Nov 2019 15:45:07 +0100
Date:   Tue, 5 Nov 2019 15:45:06 +0100
From:   Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To:     linux-watchdog@vger.kernel.org
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Steffen Trumtrar <s.trumtrar@pengutronix.de>,
        Tim Sander <tim@krieglstein.org>,
        Julia Cartwright <julia@ni.com>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH] watchdog: prevent deferral of watchdogd wakeup on RT
Message-ID: <20191105144506.clyadjbvnn7b7b2m@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

From: Julia Cartwright <julia@ni.com>

When PREEMPT_RT is enabled, all hrtimer expiry functions are
deferred for execution into the context of ksoftirqd unless otherwise
annotated.

Deferring the expiry of the hrtimer used by the watchdog core, however,
is a waste, as the callback does nothing but queue a kthread work item
and wakeup watchdogd.

It's worst then that, too: the deferral through ksoftirqd also means
that for correct behavior a user must adjust the scheduling parameters
of both watchdogd _and_ ksoftirqd, which is unnecessary and has other
side effects (like causing unrelated expiry functions to execute at
potentially elevated priority).

Instead, mark the hrtimer used by the watchdog core as being _HARD to
allow it's execution directly from hardirq context.  The work done in
this expiry function is well-bounded and minimal.

A user still must adjust the scheduling parameters of the watchdogd
to be correct w.r.t. their application needs.

Link: https://lkml.kernel.org/r/0e02d8327aeca344096c246713033887bc490dd7.1538089180.git.julia@ni.com
Cc: Guenter Roeck <linux@roeck-us.net>
Reported-and-tested-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Reported-by: Tim Sander <tim@krieglstein.org>
Signed-off-by: Julia Cartwright <julia@ni.com>
Acked-by: Guenter Roeck <linux@roeck-us.net>
[bigeasy: use only HRTIMER_MODE_REL_HARD]
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 drivers/watchdog/watchdog_dev.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/watchdog/watchdog_dev.c b/drivers/watchdog/watchdog_dev.c
index dbd2ad4c92948..d3acc0a7256ca 100644
--- a/drivers/watchdog/watchdog_dev.c
+++ b/drivers/watchdog/watchdog_dev.c
@@ -158,7 +158,8 @@ static inline void watchdog_update_worker(struct watchdog_device *wdd)
 		ktime_t t = watchdog_next_keepalive(wdd);
 
 		if (t > 0)
-			hrtimer_start(&wd_data->timer, t, HRTIMER_MODE_REL);
+			hrtimer_start(&wd_data->timer, t,
+				      HRTIMER_MODE_REL_HARD);
 	} else {
 		hrtimer_cancel(&wd_data->timer);
 	}
@@ -177,7 +178,7 @@ static int __watchdog_ping(struct watchdog_device *wdd)
 	if (ktime_after(earliest_keepalive, now)) {
 		hrtimer_start(&wd_data->timer,
 			      ktime_sub(earliest_keepalive, now),
-			      HRTIMER_MODE_REL);
+			      HRTIMER_MODE_REL_HARD);
 		return 0;
 	}
 
@@ -971,7 +972,7 @@ static int watchdog_cdev_register(struct watchdog_device *wdd, dev_t devno)
 		return -ENODEV;
 
 	kthread_init_work(&wd_data->work, watchdog_ping_work);
-	hrtimer_init(&wd_data->timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
+	hrtimer_init(&wd_data->timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL_HARD);
 	wd_data->timer.function = watchdog_timer_expired;
 
 	if (wdd->id == 0) {
@@ -1019,7 +1020,8 @@ static int watchdog_cdev_register(struct watchdog_device *wdd, dev_t devno)
 		__module_get(wdd->ops->owner);
 		kref_get(&wd_data->kref);
 		if (handle_boot_enabled)
-			hrtimer_start(&wd_data->timer, 0, HRTIMER_MODE_REL);
+			hrtimer_start(&wd_data->timer, 0,
+				      HRTIMER_MODE_REL_HARD);
 		else
 			pr_info("watchdog%d running and kernel based pre-userspace handler disabled\n",
 				wdd->id);
-- 
2.24.0

