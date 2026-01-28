Return-Path: <linux-watchdog+bounces-4839-lists+linux-watchdog=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uh9lL2qneWl/yQEAu9opvQ
	(envelope-from <linux-watchdog+bounces-4839-lists+linux-watchdog=lfdr.de@vger.kernel.org>)
	for <lists+linux-watchdog@lfdr.de>; Wed, 28 Jan 2026 07:06:34 +0100
X-Original-To: lists+linux-watchdog@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E53CC9D52B
	for <lists+linux-watchdog@lfdr.de>; Wed, 28 Jan 2026 07:06:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9A0B83007F47
	for <lists+linux-watchdog@lfdr.de>; Wed, 28 Jan 2026 06:06:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6C6A331212;
	Wed, 28 Jan 2026 06:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b2BLG0eA"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C93A156236
	for <linux-watchdog@vger.kernel.org>; Wed, 28 Jan 2026 06:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769580391; cv=none; b=Wf/+Wwtv+WGs76gfpNseS0fLq6UXRI1BU7opAwMkuyfgRG31+Yt1wfkLyrV1eSE0Ig2OvUNHULG6sKKQXVpVgIJfgU+Eh7kVfmPq2iE9jhqGmYeBTGhOLWuX07ZUwBPBYi+iRPUH3Fr59N60pErYaF3o3Qri/tUieIpXHnyiY2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769580391; c=relaxed/simple;
	bh=fD/kgZvAJFHYzXjUwTyBXUwZSjmzmlfRjg/zztY3NpI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BOBej3w8vFRD6M3NcB6mElUmMwE0Fc7TZpH4apL98VR5h6QH4UGljwo6panmuz3gqdwfWrk+C6gdzHefru1Sj2WgZjzJ+/uz7DSRUN/LmlVzVXXuyVbiiru5Pp9iFd9GemHBpcRwceEsKC3AaP1cDTYKKrVcQC+M2SSPcC0n8WI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b2BLG0eA; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-2b751c8b6beso384042eec.0
        for <linux-watchdog@vger.kernel.org>; Tue, 27 Jan 2026 22:06:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769580389; x=1770185189; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ylSEp4a0zfiE/n3fKLMKe4thGKMdljP/4PNULWhpuIc=;
        b=b2BLG0eAbFraMpVUSm2yzawP1t1+u3Q/b3njS7jDr5in4sq5gv8K7G+incDL0jLatf
         5O8SWeLqKGL/aW6D200w7ANj5aHLroKaG9s0Roo4iCH2amAZpQ4OE6YL/K1asLJqburc
         Fd96I1zaYEFJDj++K2XZp++Y+YIeagQ/Hn4xkn6e8alzBAPoOVW4Rawrb6Uc/+Af6yxf
         elckJZL0MNAdfjIS5RK07STdp+ba/lquAzT4XDkeGj4hyjiul3z6mvspfPNzjyomAksP
         bW3AchyQqENm60cpB1e1Ie3yK99ybITmFQnCPMe7npxfNVPB50hZbvFYJMWIRBGDfAZ6
         yvqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769580389; x=1770185189;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ylSEp4a0zfiE/n3fKLMKe4thGKMdljP/4PNULWhpuIc=;
        b=SNMSWu/DrCrh323cBC09aeGo4qttJanOzewsLiKZK0awySoSNKM/yePYBYjbOXw0nk
         sZV9jyNec78Ugp/R9HVk7DZI6ECrfYUuI5jnqPEFojAUWn0HM6tJV4u+mEA4fa7qIxs2
         bc2EqAy5BxKTdVcb89QpxyzuOEUkjxi23v8qOtDuW7Jbb04WrmSm2ocY+wvfB/fR1RVZ
         KhaEg8TI0rbNBQasJu4mfnrfLbsXeW1qsY84zpqAm/785F/5ORLBlQvyh4Xs0ALCcFXM
         6SualiwtDQwErP814Y/K72wirbvqt60rC/AH3q0toniaig7lO8Hvk11dJkfb0HmcY4jp
         jhwQ==
X-Gm-Message-State: AOJu0YwWGIjaEXTilD9YhiDIPsFLQjUfMah4UqFfFij3tuXYx/ruokNx
	gSrouI4VCZo1O09UcEggsmsohPavowZachY64tsCz+L1zsviGU5t+eL1
X-Gm-Gg: AZuq6aJEgCEA2Uj6J6YrwfeFJFtpGjmz6Xvk8MIFnDxip6+UzRQF2uet12a9bRQwSrK
	DX52cOaEOFdFqLDm+FEwMfc6kJGS9apLipbE3qiuLH+ZM5Av2XBbYIQCXduXFEz1qzPnsFt2Vwo
	uDmPfrHpLs9lZfOmZPebfQEEMmz2GaxlVZg49r3k+HIXTdesI0IWIdF/khuKrx3NiJTw2MJqgSI
	OlMx3UW/YNW75z5TpwfGSY3J0nMBJadhioQ42ASzzaP/0rMN8IsRWdzVxBaJJCb0lAo5N9zxlWp
	mSA9Ol3JlXr8dRdIn8tSZoQ8HRG6qYV4gpjxQQ1Fe26z3X5jRNWGol8vSXH1bmibes3YG+puQ6i
	fUXUkRL0lgpLSjNg3nCDAXq0i8KyyBAE2iFrKZ2paIjAK5gQ0ruuQ3L+r5gtR6jGkIouUWCd/8N
	VOOMI=
X-Received: by 2002:a05:693c:61d2:b0:2a4:3593:cca7 with SMTP id 5a478bee46e88-2b78e6beedbmr2168496eec.4.1769580388693;
        Tue, 27 Jan 2026 22:06:28 -0800 (PST)
Received: from debian ([74.48.213.230])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b7a17083dasm1548275eec.14.2026.01.27.22.06.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 22:06:28 -0800 (PST)
From: Qiliang Yuan <realwujing@gmail.com>
To: Li Huafei <lihuafei1@huawei.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Ingo Molnar <mingo@kernel.org>,
	Jinchao Wang <wangjinchao600@gmail.com>,
	Yicong Yang <yangyicong@hisilicon.com>,
	Qiliang Yuan <realwujing@gmail.com>,
	Thorsten Blum <thorsten.blum@linux.dev>
Cc: linux-watchdog@vger.kernel.org,
	mm-commits@vger.kernel.org,
	Shouxin Sun <sunshx@chinatelecom.cn>,
	Junnan Zhang <zhangjn11@chinatelecom.cn>,
	Song Liu <song@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7] watchdog/hardlockup: simplify perf event probe and remove per-cpu dependency
Date: Wed, 28 Jan 2026 01:05:29 -0500
Message-ID: <20260128060544.1714875-1-realwujing@gmail.com>
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
	TAGGED_FROM(0.00)[bounces-4839-lists,linux-watchdog=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[huawei.com,linux-foundation.org,kernel.org,gmail.com,hisilicon.com,linux.dev];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[chinatelecom.cn:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E53CC9D52B
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
Signed-off-by: Qiliang Yuan <realwujing@gmail.com>
Cc: Song Liu <song@kernel.org>
Cc: Jinchao Wang <wangjinchao600@gmail.com>
---
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


