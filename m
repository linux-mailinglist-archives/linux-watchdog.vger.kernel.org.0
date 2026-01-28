Return-Path: <linux-watchdog+bounces-4837-lists+linux-watchdog=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qNMcDaV1eWkSxQEAu9opvQ
	(envelope-from <linux-watchdog+bounces-4837-lists+linux-watchdog=lfdr.de@vger.kernel.org>)
	for <lists+linux-watchdog@lfdr.de>; Wed, 28 Jan 2026 03:34:13 +0100
X-Original-To: lists+linux-watchdog@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A82E9C4D3
	for <lists+linux-watchdog@lfdr.de>; Wed, 28 Jan 2026 03:34:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E38BF300AB38
	for <lists+linux-watchdog@lfdr.de>; Wed, 28 Jan 2026 02:32:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D58F23AB87;
	Wed, 28 Jan 2026 02:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D3FpUrpA"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 216F7284898
	for <linux-watchdog@vger.kernel.org>; Wed, 28 Jan 2026 02:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769567524; cv=none; b=WFL+EWqw5t32/zPNdPk/FXIsVJEWw1l0xC6JMrGWnDBnt51tbhSQwkVvlWGc6xSE/Q+doEx/2iDnalvJu8W4EwuEQ38GoXtCzWBBpIL1Vuxue5HhyPGfB7OYds4bzoZLWwoJ43ygdTxqjNSXL1elE7CnbFeqpXmU8+NT5u1RFNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769567524; c=relaxed/simple;
	bh=3zyzKCSekqq7FHMYW7I4Xhmf24lrfieQrozQP0dABJg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Qiti8sz+9KX7IRVo/otZa78B8xCT7ZjjXY1oKLTnilBYo2HP8CyvRLhGDxFKvaRfBk+a3vm3jDSRWgGPqNpRlnYZqEfO0m9iTo5U888kUwGZo7CemfUukcTRxTwyX/BHXpprw0LPErE5JYrnf/74IJ29zdIx3khmrKRPzQMn9OE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D3FpUrpA; arc=none smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-2b73112ab62so5455957eec.1
        for <linux-watchdog@vger.kernel.org>; Tue, 27 Jan 2026 18:32:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769567522; x=1770172322; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=egAN9VsiBBmLS+EOoK2lXqZdjZw63twFvoDba+Q9+sA=;
        b=D3FpUrpAPSkq7c5MzDpfnDRX1BXrInzAxy5VejW8UEwXDOqHIk+aricbX3hVMVBZqI
         sHY/58vamS2jVQIV4OGRmXNXqMmWGjdc6XNn7oRuyOCMWxjF/mhJTRAfqOR7U2wYlV4u
         EErl6jV0zCVvYqQ7iGRIrFN9agSrm7Mw/594UYDO+mrYfvJFMKQPsmtXBNn117Agmf2v
         H3LbAnMXzeSBkRzrE8uy/LjsFuy8YWCNQJlb80SwFahxnelv371Ekwkw9TKGL6yfHzHs
         pAxLDd0X2fLdvO+3jtMdWjcERLj5Sj1J2cyNwQ9OTfQpOczSFIMXjRVRhkNnzhq4okZC
         xAXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769567522; x=1770172322;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=egAN9VsiBBmLS+EOoK2lXqZdjZw63twFvoDba+Q9+sA=;
        b=dKUsherLQPiJTCCC4yl5L2iNc1ujxAHgOaPagsGk/HRnZYyJEmV1NVDpYOjVqNsUME
         q9ABGXkYOZYTL8ygN56NWfgK8QXZpZS/miYzGviEn1VrQ6U7e5t0+mNAHuPbWhq37GGF
         ZulmhG1fQ+c/QpjVc7lNip5cztyBgN0SYNdHHy0qwfJdPwVZkMpq064pfJKyywsbUB7p
         vnkXp6LJ/oGNOd1RRrO5mV59yqFrbIhgPFWJ2+TLPnjslTEdPWDPf86V7f/egT3L0aAQ
         p3fl/R1lGwbIEjIjHpM94tTeovyuX1pSYzMOds87UsS5kJenihwXbJKYklW8d1IhT30B
         /Dyg==
X-Gm-Message-State: AOJu0YyPe4eHxz21dAtua8kjU4DZOC7QIWuHCFllxVFTIYkaQYLoLY/f
	qxM7Z8DVQRdxP/CyKjFkbLrJVnu5EUPBrf1wtPTtpm54jgiKKnUuL9Ga
X-Gm-Gg: AZuq6aLE05NSXmTryX8AKAJwtxuwFUtbLS+i02ffPEBurQPseAV1r6c0A7pLOvkMiJ5
	bX9npZQbVJ/BdbPzzS2rNg/neUA16EWh1tE1XvCtD38XqCIWQMGLn9fOm4OOsMyXdVMBhUefppk
	fGw1YMIKu0RU3iKQzUpZ0ag4ySPYrc6QCoZ+9CCKMBbHpyezDpmcniHvNjQvquxuWL9PKZLLaQi
	A+vJfZ22mXz2eG91yVR5MLnQ7OcwOaI/q+0+Jd8TSgv6y0/nSGu7s05yNlRGUBhQqJuhw7ZgC3J
	I4biC15sjqqSY5E7QOPOZeb7d7PXNP+rGz7tCrbgier+nXSOfGF6CEAnZzhyJYAnUJZ1Zb6LPfF
	uFXWsZGXlInOVXOawfNKIZVvabn4bGbWEI6aEXJSziQndweGMDDWL1vqQHm4a9AW+fWh6ab4H0g
	AYDfNSE1sDRMXfrQ==
X-Received: by 2002:a05:693c:60cd:b0:2b7:97b0:82b9 with SMTP id 5a478bee46e88-2b797b09200mr1234573eec.9.1769567522217;
        Tue, 27 Jan 2026 18:32:02 -0800 (PST)
Received: from debian ([74.48.213.230])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b7a17083dasm930663eec.14.2026.01.27.18.31.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 18:32:01 -0800 (PST)
From: Qiliang Yuan <realwujing@gmail.com>
To: Qiliang Yuan <realwujing@gmail.com>,
	Li Huafei <lihuafei1@huawei.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Ingo Molnar <mingo@kernel.org>,
	Jinchao Wang <wangjinchao600@gmail.com>,
	Yicong Yang <yangyicong@hisilicon.com>,
	Thorsten Blum <thorsten.blum@linux.dev>
Cc: linux-watchdog@vger.kernel.org,
	mm-commits@vger.kernel.org,
	Shouxin Sun <sunshx@chinatelecom.cn>,
	Junnan Zhang <zhangjn11@chinatelecom.cn>,
	Qiliang Yuan <yuanql9@chinatelecom.cn>,
	Song Liu <song@kernel.org>,
	Douglas Anderson <dianders@chromium.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6] watchdog/hardlockup: simplify perf event probe and remove per-cpu dependency
Date: Tue, 27 Jan 2026 21:31:22 -0500
Message-ID: <20260128023136.1691973-1-realwujing@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-4837-lists,linux-watchdog=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,huawei.com,linux-foundation.org,kernel.org,hisilicon.com,linux.dev];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[realwujing@gmail.com,linux-watchdog@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-watchdog];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,chinatelecom.cn:email,chromium.org:email]
X-Rspamd-Queue-Id: 8A82E9C4D3
X-Rspamd-Action: no action

Simplify the hardlockup detector's probe path and remove its implicit
dependency on pinned per-cpu execution.

Refactor hardlockup_detector_event_create() to be stateless. Return
the created perf_event pointer to the caller instead of directly
modifying the per-cpu 'watchdog_ev' variable. This allows the probe
path to safely manage a temporary event without the risk of leaving
stale pointers should task migration occur.

Use cpu_hotplug_disable() during the probe to ensure the target CPU
remains stable throughout the availability check.

Signed-off-by: Shouxin Sun <sunshx@chinatelecom.cn>
Signed-off-by: Junnan Zhang <zhangjn11@chinatelecom.cn>
Signed-off-by: Qiliang Yuan <yuanql9@chinatelecom.cn>
Cc: Song Liu <song@kernel.org>
Cc: Douglas Anderson <dianders@chromium.org>
Cc: Jinchao Wang <wangjinchao600@gmail.com>
---
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


