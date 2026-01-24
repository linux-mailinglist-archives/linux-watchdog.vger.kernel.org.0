Return-Path: <linux-watchdog+bounces-4832-lists+linux-watchdog=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iHbgDPlvdGme5gAAu9opvQ
	(envelope-from <linux-watchdog+bounces-4832-lists+linux-watchdog=lfdr.de@vger.kernel.org>)
	for <lists+linux-watchdog@lfdr.de>; Sat, 24 Jan 2026 08:08:41 +0100
X-Original-To: lists+linux-watchdog@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E71177CC63
	for <lists+linux-watchdog@lfdr.de>; Sat, 24 Jan 2026 08:08:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 414143014841
	for <lists+linux-watchdog@lfdr.de>; Sat, 24 Jan 2026 07:08:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD4EB27F73A;
	Sat, 24 Jan 2026 07:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xl7/qPlD"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 619CD22756A
	for <linux-watchdog@vger.kernel.org>; Sat, 24 Jan 2026 07:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769238511; cv=none; b=Jh6CTapGM8AyLPvIrjI1mJpIUE0opCvQFvf8OOowAFS3zPxmaIdy7HTTl202VPumxLvYnEHrcVIbqeLcx95J95NDWfz4jTPmQshE40NOObVh2qfTkM9nvh+y7m6lWmYbMLQP9A5/UMrBDSHvrzPvDYM9f0fj/EKQkODutCfOytA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769238511; c=relaxed/simple;
	bh=f0WroCkTqRKE2T125f7PZut/lKVaRERWCDmHSoTNRxA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iA6vPNaJYwtNMVJRef2hEqS9jK4ew35ptmCpqAjB/Pm3aKXnhU3k7CR2eskEb/W+kjDClSj4uQylpsmX91s48Ox9nblj0XYzzXBNxG6CLnD9np1Q1lKBt0iyQvYPfRgJM/oEIajod0/9iG7PHTZ5vPXkBNy7zoKNYWQmU+Dtayc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xl7/qPlD; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-2b4520f6b32so4694482eec.0
        for <linux-watchdog@vger.kernel.org>; Fri, 23 Jan 2026 23:08:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769238508; x=1769843308; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iAlcDf31qBBwSv93L3Z4uMSzJzYFnwNA3ebbhkgX8oI=;
        b=Xl7/qPlD1uUQQYMO1kMG0uZs/0fn0BwIUVHH03domQk+oe2StTfDKMDPfor37Gk1O3
         0pA6H7k/2xNdYTeRnyLG1V1WM50SZtyBvHuCedGtp5Uu7bnVge0a2BsfL7Zbv+aIaJ/n
         xyGgMcyGmbr/o+0O/q6iUStJ0fxI4okjDmttv28vCrtzmhN13LS4b0sFlna0vVppvaQc
         MTwI+KRvPFrkSRM5ycPydQ470eCpWjHX5VgHJ23ajXc4xHr3U1kSavcOYgZTu4H1yujq
         QmK8a/+ncbi2xMrfQkzqVedOzyX8xGHtSs1hfZmrFejIgTfnRLSQsE8xZ//Dh8gMo5UP
         sDbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769238508; x=1769843308;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iAlcDf31qBBwSv93L3Z4uMSzJzYFnwNA3ebbhkgX8oI=;
        b=tXKbUTTUErCyP5NJ1b9+UEMQ/sgQ8hg2PMpjh90L43/Bukso3V8sq60kfTmVjX1kMQ
         ZWcH6y4kInkNSaQWL9Bi+uBMJbC1V+uTprPzWZErxVxCl1JrQ2B4HPXvauZXVvbTqIBP
         rhTkn/XWLQyr8vpcIH2r9s7qSIUIerjY3xN5IsPpw7vz9QUU1yXOF6AvyQVUplAZ3Oxw
         SUj0EtoDG3uI7uHJiyaQd9QSuG08ELkbQwROT+lQRBiO2lkjlrGlGsV63pTrrWUhRrad
         3Iz7r9M/2w2AUkAM3OvGm6jz9r/4p9/UIK1Onjgx4lU7alI8r47ZTaF9b3V/htt2Ssnx
         0auQ==
X-Forwarded-Encrypted: i=1; AJvYcCW1Ziospp2vbda2fQV0Ii1T0AfUGlmwgd4btW7/29jFOtNKsaicgFQ/SDVf/WysWQxIiEQ/HEkNUOY8AVN+pA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyviJX1/uQMLC7ZLcocipooaTQiEpK4IiJqCqW/SYg/rftmCnQB
	LY9yzAmLqjUbU4aYGf0fq4xgiH1JPH10Wr3wNI6wM+v8RHhIk7VG4UY/
X-Gm-Gg: AZuq6aLIs66SvR+0m0QdYXvczhnfyUun5iUPG5JvNyCrFbK/tWusdbiR8MC8o9j0Mz+
	gOdINHvUYKdp81gHsh1vOsel8k9N8eNMr4dVUIzULvGMyTZ//G0s4B2E4/GYiGaxPGRm/DICkS6
	+PDQBLE1MlWLDGfesHT+H4SvYKudeYHq/FdAaSSuSyGwy17TJZIdGx6aIk5AT5YYgDaWiLIscnM
	9a7Nv876fPi8DZKPUpgIKf4NvUij6nQwHwxPTqXZM7CCFllJUrjYpfmf1X7RzdGnO0usVIdlOK1
	nab3p6tZKcQd9VslOBDB7HKUAibdJ/XqUTvUZ1i19mQ2vsXjRGITn/E3t/4SSjNoiPtq+g70acU
	XrbBMmnESXtpvYB37WU58eZcZnG/y/jYfFwhitFoWJBkIxSLaQQMjXqRAM8zlvFxDmaKpaJIGkL
	6gLY0=
X-Received: by 2002:a05:7300:bc0e:b0:2b7:3780:810f with SMTP id 5a478bee46e88-2b739b73be3mr3051286eec.23.1769238508267;
        Fri, 23 Jan 2026 23:08:28 -0800 (PST)
Received: from debian ([74.48.213.230])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b749e301f0sm3798342eec.35.2026.01.23.23.08.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 23:08:27 -0800 (PST)
From: Qiliang Yuan <realwujing@gmail.com>
To: dianders@chromium.org
Cc: akpm@linux-foundation.org,
	lihuafei1@huawei.com,
	linux-kernel@vger.kernel.org,
	mingo@kernel.org,
	mm-commits@vger.kernel.org,
	realwujing@gmail.com,
	song@kernel.org,
	stable@vger.kernel.org,
	sunshx@chinatelecom.cn,
	thorsten.blum@linux.dev,
	wangjinchao600@gmail.com,
	yangyicong@hisilicon.com,
	yuanql9@chinatelecom.cn,
	zhangjn11@chinatelecom.cn,
	linux-watchdog@vger.kernel.org
Subject: [PATCH v4] watchdog/hardlockup: Fix UAF in perf event cleanup due to migration race
Date: Sat, 24 Jan 2026 02:08:14 -0500
Message-ID: <20260124070814.806828-1-realwujing@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <CAD=FV=WHWrKS_LVjod6nhnPdEk9_ZqeubGpft3PJOUJNMbBxfg@mail.gmail.com>
References: <CAD=FV=WHWrKS_LVjod6nhnPdEk9_ZqeubGpft3PJOUJNMbBxfg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.94 / 15.00];
	SUSPICIOUS_URL_IN_SUSPICIOUS_MESSAGE(1.00)[];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	URIBL_RED(0.50)[chinatelecom.cn:email];
	MAILLIST(-0.15)[generic];
	HAS_ANON_DOMAIN(0.10)[];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linux-foundation.org,huawei.com,vger.kernel.org,kernel.org,gmail.com,chinatelecom.cn,linux.dev,hisilicon.com];
	RCPT_COUNT_TWELVE(0.00)[16];
	DMARC_POLICY_ALLOW(0.00)[gmail.com,none];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-4832-lists,linux-watchdog=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	R_DKIM_ALLOW(0.00)[gmail.com:s=20230601];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[realwujing@gmail.com,linux-watchdog@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-watchdog];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	NEURAL_HAM(-0.00)[-0.677];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	R_SPF_ALLOW(0.00)[+ip4:172.105.105.114:c];
	DBL_BLOCKED_OPENRESOLVER(0.00)[chinatelecom.cn:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E71177CC63
X-Rspamd-Action: no action

Original analysis on Linux 4.19 showed a race condition in the hardlockup
detector's initialization phase. Specifically, during the early probe
phase, hardlockup_detector_perf_init() (renamed to
watchdog_hardlockup_probe() in newer kernels via commit d9b3629ade8e)
interacted with the per-cpu 'watchdog_ev' variable.

If the initializing task migrates to another CPU during this probe phase,
two issues arise:
1. The 'watchdog_ev' pointer on the original CPU is set but not cleared,
   leaving a stale pointer to a freed perf event.
2. The 'watchdog_ev' pointer on the new CPU might be incorrectly cleared.

Note: Although the logs below reference hardlockup_detector_perf_init(),
the same logic persists in the current watchdog_hardlockup_probe()
implementation.

This race condition was observed in console logs:
[23.038376] hardlockup_detector_perf_init 313 cur_cpu=2
...
[23.076385] hardlockup_detector_event_create 203 cpu(cur)=2 set watchdog_ev
...
[23.095788] perf_event_release_kernel 4623 cur_cpu=2
...
[23.116963] lockup_detector_reconfigure 577 cur_cpu=3

The log shows the task started on CPU 2, set watchdog_ev on CPU 2,
released the event on CPU 2, but then migrated to CPU 3 before the
cleanup logic could run. This left watchdog_ev on CPU 2 pointing to a
freed event, resulting in a UAF when later accessed:

[26.540732] BUG: KASAN: use-after-free in perf_event_ctx_lock_nested.isra.72+0x6b/0x140
[26.542442] Read of size 8 at addr ff110006b360d718 by task kworker/2:1/94

Fix this by refactoring hardlockup_detector_event_create() to return the
created perf event instead of directly assigning it to the per-cpu variable.
In the probe function, use an arbitrary CPU but ensure it remains
online via cpu_hotplug_disable() during the check.

Fixes: 930d8f8dbab9 ("watchdog/perf: adapt the watchdog_perf interface for async model")
Signed-off-by: Shouxin Sun <sunshx@chinatelecom.cn>
Signed-off-by: Junnan Zhang <zhangjn11@chinatelecom.cn>
Signed-off-by: Qiliang Yuan <realwujing@gmail.com>
Signed-off-by: Qiliang Yuan <yuanql9@chinatelecom.cn>
Cc: Song Liu <song@kernel.org>
Cc: Douglas Anderson <dianders@chromium.org>
Cc: Jinchao Wang <wangjinchao600@gmail.com>
Cc: Wang Jinchao <wangjinchao600@gmail.com>
Cc: <stable@vger.kernel.org>
---
v4:
- Add cpu_hotplug_disable() in watchdog_hardlockup_probe() to ensure the
  sampled CPU remains online during probing. 
- Update commit message to explain the relevance of 4.19 logs even
  though functions were renamed in modern kernels. 
v3:
- Refactor hardlockup_detector_event_create() to return the event pointer
  instead of directly assigning to per-cpu variables to fix the UAF.
- Restore PMU cycle fallback and unify the enable/probe paths.
v2:
- Add Cc: <stable@vger.kernel.org>.
v1:
- Avoid 'watchdog_ev' in probe path by manually creating and releasing a
  local perf event.
 kernel/watchdog_perf.c | 56 +++++++++++++++++++++++++-----------------
 1 file changed, 34 insertions(+), 22 deletions(-)

diff --git a/kernel/watchdog_perf.c b/kernel/watchdog_perf.c
index d3ca70e3c256..887b61c65c1b 100644
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
@@ -263,19 +259,35 @@ bool __weak __init arch_perf_nmi_is_available(void)
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
+	 * The requested CPU is arbitrary; preemption is not disabled, so
+	 * raw_smp_processor_id() is used. Surround with cpu_hotplug_disable()
+	 * to ensure the arbitrarily chosen CPU remains online during the check.
+	 * The event is released immediately.
+	 */
+	cpu_hotplug_disable();
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
+	cpu_hotplug_enable();
+
 	return ret;
 }
 
-- 
2.51.0


