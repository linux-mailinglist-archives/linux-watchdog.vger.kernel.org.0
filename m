Return-Path: <linux-watchdog+bounces-1377-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A6B17930A9B
	for <lists+linux-watchdog@lfdr.de>; Sun, 14 Jul 2024 17:46:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 108C4B202EE
	for <lists+linux-watchdog@lfdr.de>; Sun, 14 Jul 2024 15:46:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A93241C62;
	Sun, 14 Jul 2024 15:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gnu.org header.i=@gnu.org header.b="RZzg+L7d"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from eggs.gnu.org (eggs.gnu.org [209.51.188.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1F6E1E52A;
	Sun, 14 Jul 2024 15:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.51.188.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720972002; cv=none; b=qD7b4iPtlkMpqK7vHYjs0NKq8qlY4JKqpi919YjwXmC4R897BYBOQQSAvfPCFPtN0Gt9eGYcft8gTbMyaw3defUh6E9KeN7B64mTNrF0TgT2swCIIIpuUoWuM/6Tn5OZx00VCEduza3Yqra7KA4H/6Q3nZ62ccfcomLH2Qtncbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720972002; c=relaxed/simple;
	bh=qjUUQep3THWS+prGlG+Mj74k5poerHn1jB+9ERraKXo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MeMP6vSBCUEgnPWv1eKrCNKIwZQHsgpBMS16KOD1tJk53VjZX/Dr1jtPGnSCSaIZzqFZe1Uq2nA2K+uqIhICnnoyfoSu1eOrgt75qYcdKVoyu4BGv3hH4Q4FAlZL+8vVaKfxXjCfYH/4FVFBID/jZlgZ+Vx7eNWOb0EQnxpN43s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gnu.org; spf=pass smtp.mailfrom=gnu.org; dkim=pass (2048-bit key) header.d=gnu.org header.i=@gnu.org header.b=RZzg+L7d; arc=none smtp.client-ip=209.51.188.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gnu.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gnu.org
Received: from fencepost.gnu.org ([2001:470:142:3::e])
	by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.90_1)
	(envelope-from <othacehe@gnu.org>)
	id 1sT1Qp-0002o8-G0; Sun, 14 Jul 2024 11:46:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=gnu.org;
	s=fencepost-gnu-org; h=MIME-Version:Date:Subject:To:From:in-reply-to:
	references; bh=0pX5TaNhwWdilJfvrqAYlrssbDQsdRXZ/klhPs1TLpU=; b=RZzg+L7d2fAJsT
	H87PurY/tSvjesavYjsxIa+L/3ld7GlivwGahPLYZUMc/ywN96CkCQGmqmB3YjyaEBZiYHeNmOL0o
	vMPPsjUyncwoaUZ/zUNjfsrpRRidPflmMLvk/8YYa9qei9nqypRJj2bdEdzxjH81NgBCe0AKwKJPa
	Pu1tIRj0/M0b7IOXrdNCPfv3hPbuJoY0ahp/NM0M4CsIysRC8OR+RgHvjHCMM7F1Wphrx2Wx7oIrv
	Jr8CjI25Nss/IxTfjbsYqpjH3o/yoSFyGlUyvH+J2ifA/ZHY051mnhW/4z0Agdeu1m8WgrdF+EkzX
	ElNqECDwbmdVXbL1KFcw==;
From: Mathieu Othacehe <othacehe@gnu.org>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>
Cc: linux-watchdog@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mathieu Othacehe <othacehe@gnu.org>
Subject: [PATCH] watchdog: Inform about watchdog timeout.
Date: Sun, 14 Jul 2024 17:46:23 +0200
Message-ID: <20240714154623.32676-1-othacehe@gnu.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When the kernel stops feeding the watchdog, inform the user that it is
about to timeout in X seconds.

The message looks like: watchdog: watchdog0: timeout in 15 seconds

This is helpful to warn the user that, most likely,
CONFIG_WATCHDOG_OPEN_TIMEOUT seconds have elapsed and the userspace hasn't
start feeding the watchdog.

Signed-off-by: Mathieu Othacehe <othacehe@gnu.org>
---
 drivers/watchdog/watchdog_dev.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/watchdog/watchdog_dev.c b/drivers/watchdog/watchdog_dev.c
index e2bd266b1b5b3..0d95c91365993 100644
--- a/drivers/watchdog/watchdog_dev.c
+++ b/drivers/watchdog/watchdog_dev.c
@@ -104,6 +104,7 @@ static ktime_t watchdog_next_keepalive(struct watchdog_device *wdd)
 	ktime_t last_heartbeat, latest_heartbeat;
 	ktime_t virt_timeout;
 	unsigned int hw_heartbeat_ms;
+	int delta_to_timeout;
 
 	if (watchdog_active(wdd))
 		virt_timeout = ktime_add(wd_data->last_keepalive,
@@ -121,6 +122,17 @@ static ktime_t watchdog_next_keepalive(struct watchdog_device *wdd)
 	 */
 	last_heartbeat = ktime_sub(virt_timeout, ms_to_ktime(hw_heartbeat_ms));
 	latest_heartbeat = ktime_sub(last_heartbeat, ktime_get());
+
+	/*
+	 * If we are past the last heartbeat, inform the user that we are
+	 * about to timeout.
+	 */
+	delta_to_timeout =
+		(int)ktime_ms_delta(virt_timeout, ktime_get()) / MSEC_PER_SEC;
+	if (latest_heartbeat <= 0 && delta_to_timeout > 0)
+		pr_info("watchdog%d: timeout in %d seconds\n", wdd->id,
+			delta_to_timeout);
+
 	if (ktime_before(latest_heartbeat, keepalive_interval))
 		return latest_heartbeat;
 	return keepalive_interval;
-- 
2.45.2


