Return-Path: <linux-watchdog+bounces-4833-lists+linux-watchdog=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YIq0OJQheGk/oQEAu9opvQ
	(envelope-from <linux-watchdog+bounces-4833-lists+linux-watchdog=lfdr.de@vger.kernel.org>)
	for <lists+linux-watchdog@lfdr.de>; Tue, 27 Jan 2026 03:23:16 +0100
X-Original-To: lists+linux-watchdog@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A15D8EFEA
	for <lists+linux-watchdog@lfdr.de>; Tue, 27 Jan 2026 03:23:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D4BA73007521
	for <lists+linux-watchdog@lfdr.de>; Tue, 27 Jan 2026 02:23:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FBC52C08D5;
	Tue, 27 Jan 2026 02:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dlcal7hw"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DA1729BD9A
	for <linux-watchdog@vger.kernel.org>; Tue, 27 Jan 2026 02:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769480592; cv=none; b=ULt1yr+BlIp0FnVDIyc4yKbDUymrfItWmtkwJ0KwiAyq3R/DjeffysSEgjWt9+BaUiKCDQJ61w3CaM/smLKErQcN6mxMzn/owjejG7XuZr5lgzaskp/sjMRH70kiTrPGruNMyKJe2MK5CTlngdYoRHKNn0xVsk4b3BqT/EYjxSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769480592; c=relaxed/simple;
	bh=N64M/JIJLJwol49yhjrUkcj2FnRP1GWKH932vmf5iHg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VGoQTNW9kbsw2SaFwe3192yYYsT48MZ0OKY0RjnNx98wiognWTVtwdJhRY76tkV1aTMYnBJz9tPr+CWJP1XltUqcEUwicvP77qNf9V6ytLX6jqcuFhVT5GFrpvicoan7OWIaYvYeiV/DG4GYr5SjgJuli8hgafmsVBOPUcpxQUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dlcal7hw; arc=none smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-12339e2e2c1so3339009c88.1
        for <linux-watchdog@vger.kernel.org>; Mon, 26 Jan 2026 18:23:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769480588; x=1770085388; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=C/BKwe8/Yc0esAHXSWFatM1ucuc0hnp+X30KfdTTAPY=;
        b=Dlcal7hwWTDZxQTCOfnwtmBy8iOvHqQIJvt/bhR9jpoyNep7Rzy7GxNkhmxJEQKiQy
         yYbwJRA7THKCc62/Oe3LpKzIQLxIhYdawEv3GACkuWacW2saOFh5qwxg+ghI3gDDlq/+
         zYPK3zG9q6qrP4+UrIUPinfQI9nTB7T/7MelW+2SJgfIDF2JoXjokE0L+fHpYYhpjoI9
         XrxZFXbu60IM2lNwJKeH+dzEWgwjUyUWS9VvRS1ISFYdIP0dBsd2ehNY7maJApDM+pgj
         GxoSfdAarSs5FxsD3pr4dZldhTssR+MFqx+6aQawuiMl+T2nneWZASvc6zDA1jV1Y0b4
         Y10A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769480588; x=1770085388;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C/BKwe8/Yc0esAHXSWFatM1ucuc0hnp+X30KfdTTAPY=;
        b=qfOEcwb6bfM8n3AtxbRuiTCAWfdwitIl8hYqu2ZvTue1y94uK6pNrv3qNiw7rEtaBx
         QMV7yDvdJw+jPuxjmQqVN3r51iCETNCVphflFEputJ0dtv50RN3Mg8Fqk7+Pku7lFQj2
         7ehNA6E8mkEDiBzLnxpUltW88ucQLpDiK08iJ4QxN4ohVS5S6Eyu5KAOoyvvUuIW3JET
         hLGQeNlq14tjzSQsPS2gNF0dTF6+e0SogR/raY632YJyRzRGQcFtNWqCG6k8opMjwhAp
         ot9BH+KBPmc+BdjdMfZrNrXKUh3AL2pDSR0h+a5YdkkqK9gxMCWo57V1wS/JZe3/8Wbf
         vOug==
X-Gm-Message-State: AOJu0YzmLFueFawrEPxU8gBVBUxtUfyBFigl6RUz57YIBj3h2pU93K9O
	evC/rOQ9SxIhwsi6BxZ2TSZGAP/d9x0AECMox7gDNvb2d0fNsPGOsSoX
X-Gm-Gg: AZuq6aKyEnUSo558cxuAV/CNHY5ZQSy/cck7k6+WVhRi39+6QhvUbBvK9u2FHb03piU
	sP7b8PltK8QjIAiDlrQ1WryHc1cJ5Q4R4tc51Vn0ovMdsRkVS8gCXVKuxGdNWViD8o0Clyseq/K
	BC/pkf5Utz9pgw9YZE6EokABMmPjvCeFIkhkTK4h6y6uqcOcH/+rO8U15BAMtMhk3CTL1SENMUM
	eIt3ZfZp6/dnNki5CVOv/SOI5CGUCGBt3G4jaL9ygk+zuGxs3JSf7nUsd8ar1i3zOhdBD/8Mjtw
	syuvMz1isFxZovHE6VQ+bKy6or2QWjV09NqKZu09qv3C0IMzDRhNOR1tqbjkWuiQE1K/7h/PAH0
	Ajr9m8aTzkKjoi19NrdU6EjC/sPQZrqJ/d6T1hSllUcQGyBlsM6DCnVDBHg6rO31MaKiIRDIhMc
	tqmCw=
X-Received: by 2002:a05:7022:6725:b0:11b:9386:a383 with SMTP id a92af1059eb24-124a0e8a130mr52799c88.22.1769480588356;
        Mon, 26 Jan 2026 18:23:08 -0800 (PST)
Received: from debian ([74.48.213.230])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1247d90cda6sm20111224c88.1.2026.01.26.18.23.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 18:23:08 -0800 (PST)
From: Qiliang Yuan <realwujing@gmail.com>
To: Ingo Molnar <mingo@kernel.org>,
	Qiliang Yuan <realwujing@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Li Huafei <lihuafei1@huawei.com>,
	Thorsten Blum <thorsten.blum@linux.dev>,
	Jinchao Wang <wangjinchao600@gmail.com>,
	Yicong Yang <yangyicong@hisilicon.com>,
	Petr Mladek <pmladek@suse.com>,
	Pingfan Liu <kernelfans@gmail.com>,
	Lecopzer Chen <lecopzer.chen@mediatek.com>,
	Douglas Anderson <dianders@chromium.org>
Cc: linux-watchdog@vger.kernel.org,
	mm-commits@vger.kernel.org,
	Shouxin Sun <sunshx@chinatelecom.cn>,
	Junnan Zhang <zhangjn11@chinatelecom.cn>,
	Qiliang Yuan <yuanql9@chinatelecom.cn>,
	Song Liu <song@kernel.org>,
	stable@vger.kernel.org,
	"Yury Norov (NVIDIA)" <yury.norov@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5] watchdog/hardlockup: Fix UAF in perf event cleanup due to migration race
Date: Mon, 26 Jan 2026 21:22:24 -0500
Message-ID: <20260127022238.1182079-1-realwujing@gmail.com>
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
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,chinatelecom.cn,kernel.org,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-4833-lists,linux-watchdog=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,linux-foundation.org,huawei.com,linux.dev,hisilicon.com,suse.com,mediatek.com,chromium.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[realwujing@gmail.com,linux-watchdog@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-watchdog];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[chinatelecom.cn:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,chromium.org:email]
X-Rspamd-Queue-Id: 8A15D8EFEA
X-Rspamd-Action: no action

The hardlockup detector's probe path (watchdog_hardlockup_probe()) can
be executed in a non-pinned context, such as during the asynchronous
retry mechanism (lockup_detector_delay_init) which runs in a standard
unbound workqueue.

In this context, the existing implementation of
hardlockup_detector_event_create() suffers from a race condition due to
potential task migration. It relies on is_percpu_thread() to ensure
CPU-locality, but worker threads in a global workqueue do not carry the
PF_PERCPU_THREAD flag, causing the WARN_ON() to trigger and violating
the assumption of stable per-cpu access.

If the task migrates during the probe:
1. It might set 'watchdog_ev' on one CPU but fail to clear it if the
   subsequent migration causes the cleanup logic to run on a different CPU.
2. This leaves a stale pointer to a freed perf_event in the original
   CPU's 'watchdog_ev' variable, leading to a use-after-free (UAF) when
   the watchdog is later enabled or reconfigured.

While this issue was prominently observed in downstream kernels (like
openEuler 4.19) where initialization timings are shifted to a post-SMP
phase, it represents a latent bug in the mainline asynchronous
initialization path.

Refactor hardlockup_detector_event_create() to be stateless by returning
the created perf_event pointer instead of directly modifying the per-cpu
'watchdog_ev' variable. This allows the probe logic to safely manage
the temporary event. Use cpu_hotplug_disable() during the probe to ensure
the target CPU remains valid throughout the check.

Fixes: 930d8f8dbab9 ("watchdog/perf: adapt the watchdog_perf interface for async model")
Signed-off-by: Shouxin Sun <sunshx@chinatelecom.cn>
Signed-off-by: Junnan Zhang <zhangjn11@chinatelecom.cn>
Signed-off-by: Qiliang Yuan <realwujing@gmail.com>
Signed-off-by: Qiliang Yuan <yuanql9@chinatelecom.cn>
Cc: Song Liu <song@kernel.org>
Cc: Douglas Anderson <dianders@chromium.org>
Cc: Jinchao Wang <wangjinchao600@gmail.com>
Cc: <stable@vger.kernel.org>
---
v5:
- Refine description: clarify it identifies a latent bug in the mainline
  asynchronous retry path where worker threads lack PF_PERCPU_THREAD.
v4:
- Add cpu_hotplug_disable() in watchdog_hardlockup_probe() to stabilize
  the probe CPU.
- Update description to explain the relevance of 4.19 logs.
v3:
- Refactor hardlockup_detector_event_create() to be stateless.
v2:
- Add Cc stable.

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


