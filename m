Return-Path: <linux-watchdog+bounces-2077-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A1A3899102B
	for <lists+linux-watchdog@lfdr.de>; Fri,  4 Oct 2024 22:19:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 53F271F22105
	for <lists+linux-watchdog@lfdr.de>; Fri,  4 Oct 2024 20:19:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A70F13212A;
	Fri,  4 Oct 2024 20:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="QteVaGyT"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50CA61AA787
	for <linux-watchdog@vger.kernel.org>; Fri,  4 Oct 2024 20:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728072213; cv=none; b=Li2P+RutARxUr2AvWBghXUesvbFfKWeH48uDiDsvh+T2lUTZFfxda/CUUahfNCm5h6mkFzW0iCcmkphb4HhFXJvNr2x5puyLEXvDnaPUUfhJol5a4HpOiOPJsom6dJM9AQc/ZcPAy0ThhRD0eRKLFCCQGFNw8KeK5yKN5EjSjyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728072213; c=relaxed/simple;
	bh=IX+b0LghnDfcnrdNO78F3Jdizxh79eWxQpGF0Her+rE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fqKNnEkwahu29feAIVnkU3CqGHcaroFsXYcQvU2w44fSWFyBx/e/SoaRJBNPE73HSzc7qRVB305D4XHIbLjnL2ldbz2lAh96g+CdxKG91PwMHwwox0LfPnjs29weGf//jjEBz29a0EG3pxvAKzEHR+NBu3PB3uo+reReVd2C8Qo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=QteVaGyT; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=37DtN53WqYeQDmLHrgDa9J8oqi3XKqR9P5WZSkrQflo=; b=QteVaG
	yT13HXwrKOI9EAU7FY5oprSrhuLFp+rQUCrX1V2wwqPwBKPvJpD0uiuIpRfYZcAu
	0veU6/4dIHcR/fyUq/wk1mrgPQi+mFBXBhTyNSQX03evc+f5Y93HzAPQttImXKbO
	1l/R/KIoE1QM8vxbx6zwdDJwv4v6+PMhLRLZkAYrFQJ8a7vpWZHehjlSGmwC6Zzl
	HTv5k8ZcE4T32cyX7nlG7vLi7mmhDED7pkEbEyiEKhHdSl3sCpOu4CljxzCRGGGJ
	w7Mgik3jdaQBPp6TmIWsOx7x9Svy6vw8PVtIrY49E2CYGJFlfh2IUaFMX3d6+EMy
	M3PPNr13zvjOCKiw==
Received: (qmail 3546544 invoked from network); 4 Oct 2024 22:03:29 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 4 Oct 2024 22:03:29 +0200
X-UD-Smtp-Session: l3s3148p1@E0wqKqwjXtdQvCeD
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-watchdog@vger.kernel.org
Subject: [RFC PATCH 1/9] watchdog: always print when registering watchdog fails
Date: Fri,  4 Oct 2024 22:03:04 +0200
Message-ID: <20241004200314.5459-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241004200314.5459-1-wsa+renesas@sang-engineering.com>
References: <20241004200314.5459-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

So far, only 'watchdog_register_device' prints an error if registering
the watchdog driver fails. '__watchdog_register_device' doesn't.
Refactor the code so that both print out. Drivers can then rely on that
and skip their own error messages.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/watchdog/watchdog_core.c | 26 +++++++++++++++++---------
 1 file changed, 17 insertions(+), 9 deletions(-)

diff --git a/drivers/watchdog/watchdog_core.c b/drivers/watchdog/watchdog_core.c
index aff2c3912ead..d46d8c8c01f2 100644
--- a/drivers/watchdog/watchdog_core.c
+++ b/drivers/watchdog/watchdog_core.c
@@ -237,7 +237,7 @@ void watchdog_set_restart_priority(struct watchdog_device *wdd, int priority)
 }
 EXPORT_SYMBOL_GPL(watchdog_set_restart_priority);
 
-static int __watchdog_register_device(struct watchdog_device *wdd)
+static int ___watchdog_register_device(struct watchdog_device *wdd)
 {
 	int ret, id = -1;
 
@@ -337,6 +337,22 @@ static int __watchdog_register_device(struct watchdog_device *wdd)
 	return 0;
 }
 
+static int __watchdog_register_device(struct watchdog_device *wdd)
+{
+	const char *dev_str;
+	int ret;
+
+	ret = ___watchdog_register_device(wdd);
+	if (ret) {
+		dev_str = wdd->parent ? dev_name(wdd->parent) :
+			  (const char *)wdd->info->identity;
+		pr_err("%s: failed to register watchdog device (err = %d)\n",
+			dev_str, ret);
+	}
+
+	return ret;
+}
+
 /**
  * watchdog_register_device() - register a watchdog device
  * @wdd: watchdog device
@@ -350,7 +366,6 @@ static int __watchdog_register_device(struct watchdog_device *wdd)
 
 int watchdog_register_device(struct watchdog_device *wdd)
 {
-	const char *dev_str;
 	int ret = 0;
 
 	mutex_lock(&wtd_deferred_reg_mutex);
@@ -360,13 +375,6 @@ int watchdog_register_device(struct watchdog_device *wdd)
 		watchdog_deferred_registration_add(wdd);
 	mutex_unlock(&wtd_deferred_reg_mutex);
 
-	if (ret) {
-		dev_str = wdd->parent ? dev_name(wdd->parent) :
-			  (const char *)wdd->info->identity;
-		pr_err("%s: failed to register watchdog device (err = %d)\n",
-			dev_str, ret);
-	}
-
 	return ret;
 }
 EXPORT_SYMBOL_GPL(watchdog_register_device);
-- 
2.45.2


