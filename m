Return-Path: <linux-watchdog+bounces-4843-lists+linux-watchdog=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4KZEG+8aemlS2QEAu9opvQ
	(envelope-from <linux-watchdog+bounces-4843-lists+linux-watchdog=lfdr.de@vger.kernel.org>)
	for <lists+linux-watchdog@lfdr.de>; Wed, 28 Jan 2026 15:19:27 +0100
X-Original-To: lists+linux-watchdog@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A708FA2A41
	for <lists+linux-watchdog@lfdr.de>; Wed, 28 Jan 2026 15:19:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6F033302D8AF
	for <lists+linux-watchdog@lfdr.de>; Wed, 28 Jan 2026 14:14:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 448B526159E;
	Wed, 28 Jan 2026 14:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CS0TeV2P"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A92FA267731
	for <linux-watchdog@vger.kernel.org>; Wed, 28 Jan 2026 14:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769609652; cv=none; b=ia3qIBBxpGVhjIDhLQQAJPvQkI2rMSiBo8Fvj0f5khVM04Y6qgpf+u0a37Lr07N5vZbeqawgcuKQgKoZVBDV+3e0BFF1JZaIqX5uWL0qWrB3dLSF1OrkSQEyY6IqKDwmP70CMOYeWRC2KO6Fs6+e703usCyQYjhL7/U5ROJu4f8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769609652; c=relaxed/simple;
	bh=e4Y0gnq911FKNdWWWGAQnFXylREVdGWOawghZntWz9g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=h9HvS9pazGxRKSoPkkSY+xlrrT7kw3EEqB/cB2W/6UlfUwT4juTM11zRUVVdiYl2TRvuMCgSC4OcgiACoN7lGWls7nO930h3m19uV882bGUzi11UgcDcMpAV7o7BubjBGIDvwsWLn63KUTgmKDDxnv858bsNHf4G76Mmwz/l+80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CS0TeV2P; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-5032e15525aso19495171cf.3
        for <linux-watchdog@vger.kernel.org>; Wed, 28 Jan 2026 06:14:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769609649; x=1770214449; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NvwAkydsJHGg+bpnKIjXBjgXWCnzFDla2aq6C1Z3aaY=;
        b=CS0TeV2PqG/+n7lUU5b+LofvwPSMBjMFjQfYSVDTPzEokrh8YF5dcqF1/qyC5S3IaC
         vywtRfrjIJnLOuXQfbMF+hZpSosoqHJradVX3Tlvn+YoWYjoJu2hD8XOwyfaH50N975o
         98wxb8q1xFIARyj8SsjCqz/jvXm5J57JpDbKjkeewoDrqX+7AGnoeNJcsMGwbk5OdvJN
         te2v/nwmJpFPJlxah1RCNfON78cM/6vwlUDVXsKfLNaDDBIhwqZyiHnvmwEkw0OW3n4b
         6O+0KuAA5cNISmEwGkDOj2i0jq7/aUBrkYsd2SxbLUwWeyiTJNwPhOh567TedvJ7Hzm/
         b2Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769609649; x=1770214449;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NvwAkydsJHGg+bpnKIjXBjgXWCnzFDla2aq6C1Z3aaY=;
        b=oADpECX4+dJARhbfTo9fDVGd9+y1DpOb8r0NrsS3T3bewYSjaCeHB4m+iTZiiHm0dO
         OswA7+/X21SstRHx/Uv1xR9R1Hptskk6LOUuOLLEbTUMZ6RKnVVVq1SJCUkWW4+j1/E/
         DDpKHZH/o4Aq7i8akfyj4qgou3Jjiyi/IOyPK4nw+jNHYHuMjiRFBR+0qmMUTUx0JG/4
         KCUPbtYYTmy5BL+x8aTzxi4ip3hN2Dtnfwfs2AYNuyWmOjBPq3GmUyFAWeDvhKqSk9d6
         FXory6Nnjb8LA+rl5by1hKGKWa7wNupzIMRo12DzsJPuY8l2L+/msDoU1O0Lkg0MckQ6
         mDAQ==
X-Gm-Message-State: AOJu0YxFX2JuPw7v5TT951QGCvoPpmu2L6V8gs9fc9Lx7Z9m/qbaZGxo
	oypSnrXb+mMiKpdtcZW89+3w+k3eIklSzHNgb+Kuulr+aMqQyeikj0IOzbXT1C9z
X-Gm-Gg: AZuq6aIEeKPcKhEaSgibUq4aKYsSNatVyuALTE8fTM1UMRhf29ez7jOQL3x4gTVRz8T
	ZRtXBd3IzQ/bQwVHGG7uyUCZRfEA+ou8KgblUhpSxlM9O+hGB/MvgK3O9XwLYvc++i/tBuT2m7E
	kvu0+ylRijO4eo5AqlFW0lieCo0oSrT0FfSkCwR+cAOILl4uSI7QKiQ+Ih2JPiyIUW2BL21NBn7
	jRYVb5USXI0YKXUqDcOWEcGPh6pDZb4d8YtT8Y6QRaAn8rxXcO2ClUWLhxwnke6/x7pIWOi7NI1
	49+9zyyDxkXTJN401npagqdW6gaavD2igFDlAN5x8GyhUKMvOafoRMLwYfE+z9QltyKu4wmE94D
	hM0usFhRp337gdzJL+t2y0lYOsh9TwJGz9FeJPMX0WuRObwykFxXhPqxmG7cPp1ofK8aFa91g2V
	BTo0g=
X-Received: by 2002:a05:7301:1698:b0:2b7:32fe:4bbb with SMTP id 5a478bee46e88-2b78d910144mr2963994eec.11.1769603031325;
        Wed, 28 Jan 2026 04:23:51 -0800 (PST)
Received: from debian ([74.48.213.230])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b7a1abe57csm2783833eec.22.2026.01.28.04.23.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 04:23:50 -0800 (PST)
From: Qiliang Yuan <realwujing@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Li Huafei <lihuafei1@huawei.com>,
	Ingo Molnar <mingo@kernel.org>,
	Jinchao Wang <wangjinchao600@gmail.com>,
	Thorsten Blum <thorsten.blum@linux.dev>,
	Yicong Yang <yangyicong@hisilicon.com>
Cc: linux-watchdog@vger.kernel.org,
	mm-commits@vger.kernel.org,
	Qiliang Yuan <realwujing@gmail.com>,
	Shouxin Sun <sunshx@chinatelecom.cn>,
	Junnan Zhang <zhangjn11@chinatelecom.cn>,
	Qiliang Yuan <yuanql9@chinatelecom.cn>,
	Douglas Anderson <dianders@chromium.org>,
	Song Liu <song@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v8] watchdog/hardlockup: simplify perf event probe and remove per-cpu dependency
Date: Wed, 28 Jan 2026 07:23:15 -0500
Message-ID: <20260128122330.1761777-1-realwujing@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-4843-lists,linux-watchdog=lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,chinatelecom.cn,chromium.org,kernel.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_TO(0.00)[linux-foundation.org,huawei.com,kernel.org,gmail.com,linux.dev,hisilicon.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[realwujing@gmail.com,linux-watchdog@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-watchdog];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[chinatelecom.cn:email,chromium.org:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A708FA2A41
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


