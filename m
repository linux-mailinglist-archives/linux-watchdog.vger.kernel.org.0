Return-Path: <linux-watchdog+bounces-4848-lists+linux-watchdog=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AH6cIWTFemmY+QEAu9opvQ
	(envelope-from <linux-watchdog+bounces-4848-lists+linux-watchdog=lfdr.de@vger.kernel.org>)
	for <lists+linux-watchdog@lfdr.de>; Thu, 29 Jan 2026 03:26:44 +0100
X-Original-To: lists+linux-watchdog@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id EE3BEAB1C0
	for <lists+linux-watchdog@lfdr.de>; Thu, 29 Jan 2026 03:26:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D75D6301AB94
	for <lists+linux-watchdog@lfdr.de>; Thu, 29 Jan 2026 02:26:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECC543559E3;
	Thu, 29 Jan 2026 02:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kJoahQGH"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A4A933557E
	for <linux-watchdog@vger.kernel.org>; Thu, 29 Jan 2026 02:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769653601; cv=none; b=oWSq02G9cbIA0XQV7qRI3OREgUUBNAKnSkD7+6KGcpwAM75FwFw7pwA/239yd2pzIO0nGlOLsPzG4k4lBwhSSASTLioCCHya6sFY6AehSbulpia5vUBM8dv4/BROWJJw5M5xHiB/qz8f+3GFRFw6UMAZTb8EZ950oDJf7t5r6TM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769653601; c=relaxed/simple;
	bh=CAf2Etf/SR10lea8VN5fkUmacasr/02Ph7H3nfRTwjY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aLVm9RWyXZMmF+g1l2ynMvi3/1vSgWq6RBNPI0X3/kDU0osOQQMNLqQXcMjEXuuP2b/jyCuASKTCZ0tYMaVPm3GlKqhjKNU3fR51I8c7c72w/2NOkzqni6tb/TJaa8sU9HVZ2JhM23DIbJsw0C4Mf2MMCcQ03hX9No39hlf8qsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kJoahQGH; arc=none smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-2b785801c93so1272639eec.0
        for <linux-watchdog@vger.kernel.org>; Wed, 28 Jan 2026 18:26:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769653599; x=1770258399; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Vcq7aD3lYlVWIhmj7yegBQ/oAWD8jMRiUwoR40ggFyM=;
        b=kJoahQGH6TA33DiLoGqDe6QeC3jKjEhCv6RkyHN0j8fb8cm1fGtymAf+v0ZyedhZkc
         gsXytRmd+T3Z/Oakd8U4hEjPm8F1iyBaAdZjYQ8gd4Bvyg3w3XX51tfqasYikBUgA1wS
         1QeC6da8F9hsLw9ZrcZqj6NULR+dEEi9a+BLnrmuUITYwH6j1jAJu1Mt5F0QS386H0HC
         voEcciL/NCwEX12yRbVpkyZjOK04i7yuc0+D99cvgUGuauElTF8Q3QqLj2ULxrvSC14Q
         PC57yHympGJLdeH4SPfHjLtWOEHU1RSuBG/Bekw7r/xj4JFlFHp9ZA53RYJ9nNmS7rBf
         iAGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769653599; x=1770258399;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vcq7aD3lYlVWIhmj7yegBQ/oAWD8jMRiUwoR40ggFyM=;
        b=E39n0QoCiqNhWDdhpUwtf40/Q+91Py3ZVIuCPw5jCWM/8lv89pQfXLI0IlNSJM8RuR
         fEYLPIS7n2MIWazfuPBWzZKTHdUl7vekykTRe/OW4dDm5JNr/rBHWB2GaRtWUFUcVLvo
         EbTJfB2y96xgiJlO77EkM7qlO2ZEuTxTw18XKNHQZgd0q7KQXN5DugOE6OelybVCGr76
         I2TdYcuGDePfH0xHQQv6XiaF7ARxe0tUhxc/mb+4tZFdoKTzeN5YUUU/EXN8jNt+YHG6
         bvV8WHq1Kqg3HgrEN6/7TuU1H3WclrhwT5Cj93WAJulGFiF+MaHhoGGOzhedaz9e7scu
         /5eg==
X-Gm-Message-State: AOJu0YwvWKCyomgAQhNgW3WNnYaj634ykm3Jxg7XcqzsHc1se+dHrnjf
	or2Isz1YtXinzfvD/7FsGbfbZsx+1Gqi3P7xlsDzl5CqIuhPv48ps/NzWC9VFddu
X-Gm-Gg: AZuq6aIeLMgJfwVxpmMRXjGfk3lvsBpj1ud1EJCPoB3ALjmxwOPqBjyg68C+Y58PuPf
	odt+53g9BNrA7/G6c2D1pnJLYZ8rC+/6L4NlaqFd6y9IP+IHxJYPbyA0WNC4PiFqezvMKedeBMs
	JruB5n1SdclJk6B/lfT5HjRpsktWyNjLcSxwQxkiCWDWiDDfbiSa+4UUCujfmxixDseoDBE6n5n
	MO7NIOiPz1c50Puv3Iqk9QziposqyIaJhuKrrxecey/+IwGM5jiGK9qUThtohZA6cqdzpja7LgC
	4Bw9M0eJ/9c+/inQz7EybgDuMwzYYLXGiN/pp6DKjjO/lwUMgD5vUTslCp8YC1+Eysa+SZZvE5v
	MDgcG453IdlUULurk9vwdrv/wgqyQWt92OCtWLftzL4ajvDlq5g5unBwRVSiXCUAAmM17JPE6J8
	lKuUI=
X-Received: by 2002:a05:7301:9f03:b0:2b7:3955:f50a with SMTP id 5a478bee46e88-2b78da4a0b4mr4654448eec.41.1769653597804;
        Wed, 28 Jan 2026 18:26:37 -0800 (PST)
Received: from debian ([74.48.213.230])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b7a1adef97sm5088827eec.29.2026.01.28.18.26.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 18:26:37 -0800 (PST)
From: Qiliang Yuan <realwujing@gmail.com>
To: Ingo Molnar <mingo@kernel.org>,
	Li Huafei <lihuafei1@huawei.com>,
	Qiliang Yuan <realwujing@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Jinchao Wang <wangjinchao600@gmail.com>,
	Yicong Yang <yangyicong@hisilicon.com>,
	Thorsten Blum <thorsten.blum@linux.dev>
Cc: linux-watchdog@vger.kernel.org,
	mm-commits@vger.kernel.org,
	Shouxin Sun <sunshx@chinatelecom.cn>,
	Junnan Zhang <zhangjn11@chinatelecom.cn>,
	Qiliang Yuan <yuanql9@chinatelecom.cn>,
	Douglas Anderson <dianders@chromium.org>,
	Song Liu <song@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v9] watchdog/hardlockup: simplify perf event probe and remove per-cpu dependency
Date: Wed, 28 Jan 2026 21:26:14 -0500
Message-ID: <20260129022629.2201331-1-realwujing@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-4848-lists,linux-watchdog=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,huawei.com,gmail.com,linux-foundation.org,hisilicon.com,linux.dev];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[realwujing@gmail.com,linux-watchdog@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-watchdog];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: EE3BEAB1C0
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
v9:
- remove unused `#include <linux/cpu.h>`
v8:
- Add Signed-off-by with work email.
v7:
- Update Signed-off-by to match author email.
- Remove redundant cpu_hotplug_disable() in probe path.
v6:
- Change title to "simplify/cleanup" and remove "Fixes" tag since the issue
  is not reproducible on mainline.
- Rewrite commit message in imperative mood.
- Clarify that mainline is safe while this improves robustness.
v5:
- Refine description: clarify that the retry path uses worker threads
  without PF_PERCPU_THREAD (though mainline is safe due to system_percpu_wq).
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

 kernel/watchdog_perf.c | 50 +++++++++++++++++++++++-------------------
 1 file changed, 28 insertions(+), 22 deletions(-)

diff --git a/kernel/watchdog_perf.c b/kernel/watchdog_perf.c
index d3ca70e3c256..cf05775a96d3 100644
--- a/kernel/watchdog_perf.c
+++ b/kernel/watchdog_perf.c
@@ -118,18 +118,11 @@ static void watchdog_overflow_callback(struct perf_event *event,
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
 
@@ -143,14 +136,7 @@ static int hardlockup_detector_event_create(void)
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
@@ -159,17 +145,26 @@ static int hardlockup_detector_event_create(void)
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
@@ -263,19 +258,30 @@ bool __weak __init arch_perf_nmi_is_available(void)
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


