Return-Path: <linux-watchdog+bounces-4842-lists+linux-watchdog=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CK9pIOYPemnH2AEAu9opvQ
	(envelope-from <linux-watchdog+bounces-4842-lists+linux-watchdog=lfdr.de@vger.kernel.org>)
	for <lists+linux-watchdog@lfdr.de>; Wed, 28 Jan 2026 14:32:22 +0100
X-Original-To: lists+linux-watchdog@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E60EFA2301
	for <lists+linux-watchdog@lfdr.de>; Wed, 28 Jan 2026 14:32:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2E614306CF47
	for <lists+linux-watchdog@lfdr.de>; Wed, 28 Jan 2026 13:29:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 505DB352FAE;
	Wed, 28 Jan 2026 13:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kuJ9iQ0C"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAC8F352FA7
	for <linux-watchdog@vger.kernel.org>; Wed, 28 Jan 2026 13:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769606978; cv=none; b=uHOdvmDQU8708bZWzNaUdaGWA7rYsaKDcaZ4deakuKwiBNiRKc56lZ1E6azao2j54zPZOCvtFg4+qIOX+l0BX9v3OrFYg1tC3kaQbVN1ujibajDLTlsMU3cqhk9pDcHTYA1YAKm/hWh2KB095tYhaclVYMxVcZdqx2wK7TrWauA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769606978; c=relaxed/simple;
	bh=e4Y0gnq911FKNdWWWGAQnFXylREVdGWOawghZntWz9g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=koumTsui2wrOThs2sJxYEeWmGfV3UqCnE+fJBhGNug2n3fXkxOb/5aJmnabEPQ8T1gg64MkmTZmp4J+Tas5bQHgaq8muamKlND7axGAPAwS4CIQnLxbOFSwqjI0PHHwPBh3t3Ls+bww+qm3q7zBEPIXGusBa/FhRdMIMd+G8IWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kuJ9iQ0C; arc=none smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-2b70abe3417so15071369eec.0
        for <linux-watchdog@vger.kernel.org>; Wed, 28 Jan 2026 05:29:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769606976; x=1770211776; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NvwAkydsJHGg+bpnKIjXBjgXWCnzFDla2aq6C1Z3aaY=;
        b=kuJ9iQ0C/NR9bzW3e/wucgWnSOdRl/dEBM2YraYmhtOI/KINB/ctoCUe/v5hPvHEMw
         rUeZACiCFXycJU2b+3CXX79+adtJBTAGGdFgmP7AS+9plaAuRq1ogyenfJOoxe34VNia
         RbMxeHUhHc4r+agPGg+N5n6ccm3uN/YemcKFaKARrBlsOYgLwaV79qKrF6ufNwPfQPPd
         uo9/X3JxCKbmvmxv2/36zKF89IzmPo6ov9v5dx6qGGFOMB7KJEou9lSBAo7m8wOBOkoe
         GjQ9SHYQ6t3nNr7wxIa0kzcQp4stU58zP0+abESKenMNRksIw02uKIVNIljZx056r+wm
         +jFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769606976; x=1770211776;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NvwAkydsJHGg+bpnKIjXBjgXWCnzFDla2aq6C1Z3aaY=;
        b=YafpeRKICtpTjfiFS1dDJFDJ7TjjLFkxhUZqYdGxlNFb5DctbOnTtw2Gmhra7lMZj9
         38N+KNwvSghQkPOtIfUKdoc27C9MCaSy3xPCYmbUVZvckn882BYNvxABg8QmcAnhbiQ2
         pVJxiYpjUqZMNCjyVUISOtKiFmIdKA6l9EPSzJBIv/r5prlYcJw4CWSvhGq8qz8nddbd
         Lnml3aI8fIBulB1huGQnRZ/OJ1P5yY63LzWS7xkpdFeOJQMEKHpnXXyadeoMYDCWVuZr
         n/KDOpUA4j/GhLn6LkST15j4w7TFyAXWZ++aEoaDpXW8YdBCp1/jJ0qY8sId34ALSMlo
         vcDQ==
X-Gm-Message-State: AOJu0YwIzEzzaK/DZKCFGjE7UffIcl+wWVKsW/2Qh5ouPlS2nHhT9lIf
	TFeRBAng3INdp8ns7/d9lGBTOM2Q2fIj/lpBWQyHqNWQ1HNJWkj7eDCSlpkJ/j6v
X-Gm-Gg: AZuq6aLEqcUB3SJoRnXmOAJO9N892shZbZSy5I4iyEMDrH6oOe8TfFJoiM86yB71x6U
	TSIfi4d1LL8PtHil7i5//tYgWP/UVbfCOZHluFDHrv+AEIy8saNb9CPkRjavmqDgMdqGzMu5kY2
	i00Gwe37ZkSIsPV+viVE0uDyhAzf0gXuwevXy+pSvsfiUwjhQs/QS78Pn/PxSGxkWy2Ijid5nPX
	IXKg+nysgDyqHD5w/dms+Hsns3lH1y94rhX5SIWwWQ8aROV8fHYyYPJcr79yav++PLjIhCFo8AN
	B1A/J2ax022gdeCEZfE1jyORHisHvb/f7BCZZW8RHyHacQ20IArqNExk5g4aVG4R9DI8WL4lDiG
	rBKLHpwJwUv6xOE3vSYDEAvi5IqbiQF260sOU59XoEXohazSD47i/Kq1jb7JfXdvdNGhEj1HpAJ
	Pk4ig=
X-Received: by 2002:a05:7022:e0e:b0:11e:70d8:5dbb with SMTP id a92af1059eb24-124a005f9damr2907058c88.7.1769601247809;
        Wed, 28 Jan 2026 03:54:07 -0800 (PST)
Received: from debian ([74.48.213.230])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-124a9debe5dsm2173511c88.11.2026.01.28.03.54.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 03:54:07 -0800 (PST)
From: Qiliang Yuan <realwujing@gmail.com>
To: Ingo Molnar <mingo@kernel.org>,
	Qiliang Yuan <realwujing@gmail.com>,
	Li Huafei <lihuafei1@huawei.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Jinchao Wang <wangjinchao600@gmail.com>,
	Thorsten Blum <thorsten.blum@linux.dev>,
	Yicong Yang <yangyicong@hisilicon.com>
Cc: linux-watchdog@vger.kernel.org,
	mm-commits@vger.kernel.org,
	Shouxin Sun <sunshx@chinatelecom.cn>,
	Junnan Zhang <zhangjn11@chinatelecom.cn>,
	Qiliang Yuan <yuanql9@chinatelecom.cn>,
	Douglas Anderson <dianders@chromium.org>,
	Song Liu <song@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v8] watchdog/hardlockup: simplify perf event probe and remove per-cpu dependency
Date: Wed, 28 Jan 2026 06:53:44 -0500
Message-ID: <20260128115358.1757147-1-realwujing@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-4842-lists,linux-watchdog=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,huawei.com,linux-foundation.org,linux.dev,hisilicon.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[realwujing@gmail.com,linux-watchdog@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-watchdog];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[chromium.org:email,chinatelecom.cn:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E60EFA2301
X-Rspamd-Action: no action

Simplify the hardlockup detector's probe path and remove its implicit
dependency on pinned per-cpu execution.

Refactor hardlockup_detector_event_create() to be stateless. Return
the created perf_event pointer to the caller instead of directly
modifying the per-cpu 'watchdog_ev' variable. This allows the probe
path to safely manage a temporary event without the risk of leaving
stale pointers should task migration occur.

Signed-off-by: Shouxin Sun <sunshx@chinatelecom.cn>
Signed-off-by: Junnan Zhang <zhangjn11@chinatelecom.cn>
Signed-off-by: Qiliang Yuan <yuanql9@chinatelecom.cn>
Signed-off-by: Qiliang Yuan <realwujing@gmail.com>
Cc: Douglas Anderson <dianders@chromium.org>
Cc: Song Liu <song@kernel.org>
Cc: Jinchao Wang <wangjinchao600@gmail.com>
---
v8:
- Add Signed-off-by with work email.
- v7 link: https://lore.kernel.org/all/20260128060833.1715622-1-realwujing@gmail.com/
v7:
- Update Signed-off-by to match author email.
- Remove redundant cpu_hotplug_disable() in probe path.
- v6 link: https://lore.kernel.org/all/20260128023136.1691973-1-realwujing@gmail.com/
v6:
- Change title to "simplify/cleanup" and remove "Fixes" tag since the issue
  is not reproducible on mainline.
- Rewrite commit message in imperative mood.
- Clarify that mainline is safe while this improves robustness.
- v5 link: https://lore.kernel.org/all/20260127022238.1182079-1-realwujing@gmail.com/
v5:
- Refine description: clarify that the retry path uses worker threads
  without PF_PERCPU_THREAD (though mainline is safe due to system_percpu_wq).
- v4 link: https://lore.kernel.org/all/20260124070814.806828-1-realwujing@gmail.com/
v4:
- Add cpu_hotplug_disable() in watchdog_hardlockup_probe() to stabilize
  the probe CPU.
- Update description to explain the relevance of 4.19 logs.
v3:
- Refactor hardlockup_detector_event_create() to be stateless by returning
  the event pointer instead of directly assigning to per-cpu variables.
- Restore PMU cycle fallback and unify the enable/probe paths.
v2:
- Add Cc: stable@vger.kernel.org.
v1:
- Avoid 'watchdog_ev' in probe path by manually creating and releasing a
  local perf event.

 kernel/watchdog_perf.c | 51 ++++++++++++++++++++++++------------------
 1 file changed, 29 insertions(+), 22 deletions(-)

diff --git a/kernel/watchdog_perf.c b/kernel/watchdog_perf.c
index d3ca70e3c256..4a798443033b 100644
--- a/kernel/watchdog_perf.c
+++ b/kernel/watchdog_perf.c
@@ -17,6 +17,7 @@
 #include <linux/atomic.h>
 #include <linux/module.h>
 #include <linux/sched/debug.h>
+#include <linux/cpu.h>
 
 #include <asm/irq_regs.h>
 #include <linux/perf_event.h>
@@ -118,18 +119,11 @@ static void watchdog_overflow_callback(struct perf_event *event,
 	watchdog_hardlockup_check(smp_processor_id(), regs);
 }
 
-static int hardlockup_detector_event_create(void)
+static struct perf_event *hardlockup_detector_event_create(unsigned int cpu)
 {
-	unsigned int cpu;
 	struct perf_event_attr *wd_attr;
 	struct perf_event *evt;
 
-	/*
-	 * Preemption is not disabled because memory will be allocated.
-	 * Ensure CPU-locality by calling this in per-CPU kthread.
-	 */
-	WARN_ON(!is_percpu_thread());
-	cpu = raw_smp_processor_id();
 	wd_attr = &wd_hw_attr;
 	wd_attr->sample_period = hw_nmi_get_sample_period(watchdog_thresh);
 
@@ -143,14 +137,7 @@ static int hardlockup_detector_event_create(void)
 						       watchdog_overflow_callback, NULL);
 	}
 
-	if (IS_ERR(evt)) {
-		pr_debug("Perf event create on CPU %d failed with %ld\n", cpu,
-			 PTR_ERR(evt));
-		return PTR_ERR(evt);
-	}
-	WARN_ONCE(this_cpu_read(watchdog_ev), "unexpected watchdog_ev leak");
-	this_cpu_write(watchdog_ev, evt);
-	return 0;
+	return evt;
 }
 
 /**
@@ -159,17 +146,26 @@ static int hardlockup_detector_event_create(void)
  */
 void watchdog_hardlockup_enable(unsigned int cpu)
 {
+	struct perf_event *evt;
+
 	WARN_ON_ONCE(cpu != smp_processor_id());
 
-	if (hardlockup_detector_event_create())
+	evt = hardlockup_detector_event_create(cpu);
+	if (IS_ERR(evt)) {
+		pr_debug("Perf event create on CPU %d failed with %ld\n", cpu,
+			 PTR_ERR(evt));
 		return;
+	}
 
 	/* use original value for check */
 	if (!atomic_fetch_inc(&watchdog_cpus))
 		pr_info("Enabled. Permanently consumes one hw-PMU counter.\n");
 
+	WARN_ONCE(this_cpu_read(watchdog_ev), "unexpected watchdog_ev leak");
+	this_cpu_write(watchdog_ev, evt);
+
 	watchdog_init_timestamp();
-	perf_event_enable(this_cpu_read(watchdog_ev));
+	perf_event_enable(evt);
 }
 
 /**
@@ -263,19 +259,30 @@ bool __weak __init arch_perf_nmi_is_available(void)
  */
 int __init watchdog_hardlockup_probe(void)
 {
+	struct perf_event *evt;
+	unsigned int cpu;
 	int ret;
 
 	if (!arch_perf_nmi_is_available())
 		return -ENODEV;
 
-	ret = hardlockup_detector_event_create();
+	if (!hw_nmi_get_sample_period(watchdog_thresh))
+		return -EINVAL;
 
-	if (ret) {
+	/*
+	 * Test hardware PMU availability by creating a temporary perf event.
+	 * The event is released immediately.
+	 */
+	cpu = raw_smp_processor_id();
+	evt = hardlockup_detector_event_create(cpu);
+	if (IS_ERR(evt)) {
 		pr_info("Perf NMI watchdog permanently disabled\n");
+		ret = PTR_ERR(evt);
 	} else {
-		perf_event_release_kernel(this_cpu_read(watchdog_ev));
-		this_cpu_write(watchdog_ev, NULL);
+		perf_event_release_kernel(evt);
+		ret = 0;
 	}
+
 	return ret;
 }
 
-- 
2.51.0


