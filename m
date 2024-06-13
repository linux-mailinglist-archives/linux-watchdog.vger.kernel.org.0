Return-Path: <linux-watchdog+bounces-1117-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 224849078BA
	for <lists+linux-watchdog@lfdr.de>; Thu, 13 Jun 2024 18:51:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4B3F7284B3F
	for <lists+linux-watchdog@lfdr.de>; Thu, 13 Jun 2024 16:42:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91EE61494B5;
	Thu, 13 Jun 2024 16:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="hqJIAeaq"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A67D51494D1;
	Thu, 13 Jun 2024 16:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718296952; cv=none; b=HuHc988/JI7R94NT498hDH0lyGqTfYoLx4Du+FMzKH284H6a1XASkWQjjs3wfi9uDrSvOuajz2Kb/kNjGEcnkORM5W0Xqtb3oxFQJoEoahysfmOmHqqEKWcZaTyLkiTpJk3J5oR12hDyd2X6O1MVpn6oNqgQX2Q0EJmVH4QAOEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718296952; c=relaxed/simple;
	bh=Rwt9PdDlBPU1Mtk8I78hJCVMn23gkkE1PpUlz0qmemU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=cDOJiFy4/FRVOVVKYtFxeFM8uorFTLXP+pV/HgEkVCHnTU1zLUiHzBvZ10gSuaMNSXgq8BU5Xqk9ZZBww+gJQLiRxrCoawnfys6wtxsaXYkzSW3Qwnt508f+aYVKPRToleWZ5AGVSnCVagIHtP1lHt/gG5AYZvtEyRRYZSmi+t0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=hqJIAeaq; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 63AF2FF806;
	Thu, 13 Jun 2024 16:42:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1718296942;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=4dJR3hHbvgKmOl5sUDZdsAffIZFQ6lBPh0rzTj8sNRs=;
	b=hqJIAeaqOGMgsL2S+VuFTO8+j4NW7CjsmyX26xsMZdv4kQdapRvADPzBTIBGaU1ZsGWI19
	od+G7uXc9+Nd1sHNGsr5Ck77HElrJqF7nek+xBxiGYVRTwC532NwufMKnFBhGmH5wFh2A6
	MCEZA31gAoBan5ilW75Kv/3h1iJatr7z/Mad283QjSGMMBIYlS80HsaZzz2BtBAgW4S1cl
	TGm+iqZpaqt1F2MKT6HktF9/zm4J2ZXrBdFCn5efLHuotbPxcu8h9LrOPBD5kn4KwT+G2Z
	jOF9RknNfjZuAxfWN0ffW4RCNNGyhieuHzmdUVi+E7s5Vh1FTr0tIm+6q5U2aw==
From: Thomas Richard <thomas.richard@bootlin.com>
To: wim@linux-watchdog.org,
	linux@roeck-us.net
Cc: linux-watchdog@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	michael.brunner@kontron.com,
	thomas.richard@bootlin.com,
	thomas.petazzoni@bootlin.com
Subject: [PATCH] watchdog: kempld: use pretimeout member of watchdog_device struct
Date: Thu, 13 Jun 2024 18:41:57 +0200
Message-Id: <20240613164157.457693-1-thomas.richard@bootlin.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: thomas.richard@bootlin.com

Th driver was written whereas pretimeout wasn't supported by the watchdog
core. So the pretimeout was stored in the driver data.

Now the core has pretimeout support, so use it.

Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
---
 drivers/watchdog/kempld_wdt.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/watchdog/kempld_wdt.c b/drivers/watchdog/kempld_wdt.c
index e6c7a2906680..ebb873502203 100644
--- a/drivers/watchdog/kempld_wdt.c
+++ b/drivers/watchdog/kempld_wdt.c
@@ -73,7 +73,6 @@ struct kempld_wdt_stage {
 struct kempld_wdt_data {
 	struct kempld_device_data	*pld;
 	struct watchdog_device		wdd;
-	unsigned int			pretimeout;
 	struct kempld_wdt_stage		stage[KEMPLD_WDT_MAX_STAGES];
 	u8				pm_status_store;
 };
@@ -205,8 +204,8 @@ static int kempld_wdt_set_timeout(struct watchdog_device *wdd,
 	timeout_stage = &wdt_data->stage[STAGE_TIMEOUT];
 	pretimeout_stage = &wdt_data->stage[STAGE_PRETIMEOUT];
 
-	if (pretimeout_stage->mask && wdt_data->pretimeout > 0)
-		timeout = wdt_data->pretimeout;
+	if (pretimeout_stage->mask && wdd->pretimeout > 0)
+		timeout = wdd->pretimeout;
 
 	ret = kempld_wdt_set_stage_action(wdt_data, timeout_stage,
 						ACTION_RESET);
@@ -249,13 +248,14 @@ static int kempld_wdt_set_pretimeout(struct watchdog_device *wdd,
 	if (ret)
 		return ret;
 
-	wdt_data->pretimeout = pretimeout;
+	wdd->pretimeout = pretimeout;
 	return 0;
 }
 
 static void kempld_wdt_update_timeouts(struct kempld_wdt_data *wdt_data)
 {
 	struct kempld_device_data *pld = wdt_data->pld;
+	struct watchdog_device *wdd = &wdt_data->wdd;
 	struct kempld_wdt_stage *pretimeout_stage;
 	struct kempld_wdt_stage *timeout_stage;
 	unsigned int pretimeout, timeout;
@@ -269,11 +269,11 @@ static void kempld_wdt_update_timeouts(struct kempld_wdt_data *wdt_data)
 	kempld_release_mutex(pld);
 
 	if (pretimeout)
-		wdt_data->pretimeout = timeout;
+		wdd->pretimeout = timeout;
 	else
-		wdt_data->pretimeout = 0;
+		wdd->pretimeout = 0;
 
-	wdt_data->wdd.timeout = pretimeout + timeout;
+	wdd->timeout = pretimeout + timeout;
 }
 
 static int kempld_wdt_start(struct watchdog_device *wdd)
@@ -336,7 +336,6 @@ static int kempld_wdt_keepalive(struct watchdog_device *wdd)
 static long kempld_wdt_ioctl(struct watchdog_device *wdd, unsigned int cmd,
 				unsigned long arg)
 {
-	struct kempld_wdt_data *wdt_data = watchdog_get_drvdata(wdd);
 	void __user *argp = (void __user *)arg;
 	int ret = -ENOIOCTLCMD;
 	int __user *p = argp;
@@ -352,7 +351,7 @@ static long kempld_wdt_ioctl(struct watchdog_device *wdd, unsigned int cmd,
 		ret = kempld_wdt_keepalive(wdd);
 		break;
 	case WDIOC_GETPRETIMEOUT:
-		ret = put_user(wdt_data->pretimeout, (int __user *)arg);
+		ret = put_user(wdd->pretimeout, (int __user *)arg);
 		break;
 	}
 
-- 
2.39.2


