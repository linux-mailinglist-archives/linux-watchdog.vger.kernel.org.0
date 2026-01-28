Return-Path: <linux-watchdog+bounces-4840-lists+linux-watchdog=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UHgzBPineWl/yQEAu9opvQ
	(envelope-from <linux-watchdog+bounces-4840-lists+linux-watchdog=lfdr.de@vger.kernel.org>)
	for <lists+linux-watchdog@lfdr.de>; Wed, 28 Jan 2026 07:08:56 +0100
X-Original-To: lists+linux-watchdog@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AE93A9D560
	for <lists+linux-watchdog@lfdr.de>; Wed, 28 Jan 2026 07:08:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8BA2530137BD
	for <lists+linux-watchdog@lfdr.de>; Wed, 28 Jan 2026 06:08:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AFF23358C2;
	Wed, 28 Jan 2026 06:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="My+DOeze"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37FCE156236
	for <linux-watchdog@vger.kernel.org>; Wed, 28 Jan 2026 06:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769580524; cv=none; b=Ui96HEfLzIumvuGohxphJx8E/I/fItXnIippvBFAIJTwUUcS5XSfOjJwWvrDIKCxfI/oIbSn/LCrWEFCY00INl/2cMEk4ZzxtL6dKe6rS1uSWxDEPpu+8otpbHPEnTVc0/oL37OcVVxBDKD8OZrRY0fC6NXGOprGw/xhI+ugd9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769580524; c=relaxed/simple;
	bh=nTDMX7ZWxromGef+A1hQrj0FD4zSgy7wQCxsLDWsLLo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=k+wSmCYfIhlObAlsK7+q5LdJ5CoVv20nwhR8ubPI7QpTI0Hh+YOA6yzDRsRaiuHaQon0A9HclJzzVmpjWoyzMT7YhY+wvFmeEVHKUepjayg0KDhiq2femL9jVoAtgeNtQgBEtH2LUDbb3fQBgeHJm0an6sUYWWKajynYYL/sSag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=My+DOeze; arc=none smtp.client-ip=74.125.82.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-11f36012fb2so9244248c88.1
        for <linux-watchdog@vger.kernel.org>; Tue, 27 Jan 2026 22:08:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769580521; x=1770185321; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dRr4jIl7Bao30zrJYUUg6+SPscP6OcBW6AUU+VZycno=;
        b=My+DOezeQO2tSDhVUBoehFdWK+aBUl+Vkd572qOtlavCHhXGXbZvHX0eYuuJNJ7K8V
         lRx9iw7l75R9eCvKLMwa/prbKXLQXUF8/1ypkJ9fx8fodW+rdVDrcnXCRFY+emgrvvJH
         KrcZC4hhviHESgflfOugvHgj5SIgCYj+Gsx3LDoGZG+7IhDiae3EdF9OUs/4ZJ5QBTmu
         rwMu1+z0D5UBqwqCtFF0Ev7oMm/16X1SHuW/wwzYlub0HY6cs6gc8bIEXwyGbAEbUI9p
         EBwlzQ/i8ngrAOT7L3uobBVJSNX0fqw+q0YFKu/kP47VxMMDjotnKQLFus6AhYd3GhC2
         KJMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769580521; x=1770185321;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dRr4jIl7Bao30zrJYUUg6+SPscP6OcBW6AUU+VZycno=;
        b=LXyRnKWmd5pK5U3CLYGO2pDk/cJ69I+uUEmwIb1KwseGaVW7tDsPLqeIG5vDxAOV+h
         swrWArBVqAYM8jDb4GYXc8S+naGlejGeStnf79w1GTXslrZSh+Gyg8WFUKwzpzVjLLIf
         9ATr2ZsaNvdhx9hBFW14exsb0acfYKAF3PC6U8cJCpJKa2cfD+vpAR3sh0NmCW91quZx
         fSNMMQhzS7nw3a1jG7DWWDYLfx5AClsU6wU9HhjXb/7duEhbAXRxu1js0x3CY3Y2Djyj
         pg8Cfg30w4DGdDcubNhcUQ4Fq8P+a9+Awki9aupJegDFBC9Tb085IeO1N39KX5uTWFhI
         osFw==
X-Gm-Message-State: AOJu0Yz1CwG/OO37ZkvdrMZIy/TQiQbOZzuNaZFZGXTtCH/claODcUds
	nu23+Pcpt368NlMfXiSpCfWHlHKuGPrMnP31d60Vp9yFQLkgv6+ADOoG
X-Gm-Gg: AZuq6aKihCOAWM/VXnpg8YT7TbZ6rcxzoLuAvBr5/oPU2HLQqG/Y0GZnyYSs+GNk06O
	YXbGJLBA8H+cTPJGonwHoKP7NFuKQY2gPUDII1Uo5Lf64t2sc4OeJqdwQ+tqYkQbxfAkGrhT12C
	+nAiuxcjWoq4is0WC0sU7Vve87CTncoIJQky0sdntHwYLhS9syi3k68n0AjyTQ1WUDYArEQhHSu
	PYXE8K01gn261CP/rZl3WXTW6U6OZYZw9WyNaIc/YhpxMB6DpIuxX6xTQa/YOVeW/MqkSCUFhDJ
	dGFow57zaQdQM6SGkVUb79r8mMd1LHSLtX2oHEKCaqVqC6VeYufzqGpBjqgg/AH3LysByHh6QV+
	eJEzWEdHTo8W702qmQoDWNKUvqjMnuJFtecXO2+FXcQpCpH5BE4Xdtod88oWpemylmj75v5cd0Z
	J9/xs=
X-Received: by 2002:a05:7022:628e:b0:11f:3483:bba8 with SMTP id a92af1059eb24-124a00d193dmr2449710c88.40.1769580521260;
        Tue, 27 Jan 2026 22:08:41 -0800 (PST)
Received: from debian ([74.48.213.230])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-124a9efd3b8sm1140076c88.17.2026.01.27.22.08.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 22:08:40 -0800 (PST)
From: Qiliang Yuan <realwujing@gmail.com>
To: Li Huafei <lihuafei1@huawei.com>,
	Ingo Molnar <mingo@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Shouxin Sun <sunshx@chinatelecom.cn>,
	"Yury Norov (NVIDIA)" <yury.norov@gmail.com>,
	Yicong Yang <yangyicong@hisilicon.com>,
	Thorsten Blum <thorsten.blum@linux.dev>,
	Jinchao Wang <wangjinchao600@gmail.com>,
	Qiliang Yuan <realwujing@gmail.com>
Cc: linux-watchdog@vger.kernel.org,
	mm-commits@vger.kernel.org,
	Junnan Zhang <zhangjn11@chinatelecom.cn>,
	Douglas Anderson <dianders@chromium.org>,
	Song Liu <song@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7] watchdog/hardlockup: simplify perf event probe and remove per-cpu dependency
Date: Wed, 28 Jan 2026 01:08:15 -0500
Message-ID: <20260128060833.1715622-1-realwujing@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-4840-lists,linux-watchdog=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_TO(0.00)[huawei.com,kernel.org,linux-foundation.org,chinatelecom.cn,gmail.com,hisilicon.com,linux.dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[realwujing@gmail.com,linux-watchdog@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-watchdog];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,chinatelecom.cn:email,chromium.org:email]
X-Rspamd-Queue-Id: AE93A9D560
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
Cc: Douglas Anderson <dianders@chromium.org>
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


