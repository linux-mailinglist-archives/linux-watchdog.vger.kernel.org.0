Return-Path: <linux-watchdog+bounces-1119-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 269C8907F20
	for <lists+linux-watchdog@lfdr.de>; Fri, 14 Jun 2024 00:57:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 378C91C226EC
	for <lists+linux-watchdog@lfdr.de>; Thu, 13 Jun 2024 22:57:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AA4F13BACB;
	Thu, 13 Jun 2024 22:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="tkCPtIW+"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80EF9137923;
	Thu, 13 Jun 2024 22:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718319453; cv=none; b=URzgGCWYtNM7ISeuFYFNACK5LLq0XaMQrG+PfmujK8ezl0a/mCoajhNVVa9M9x/5Xz3s5dtLayQSTUtrntCXYvaIhfjw61Ph5AJpF0lGwQ5fMoj3T1dCaBHjthu5f8pEe5yC0zBxMi0mRQDhpduuoO1ZZLhqF4wtMKlGSXziXp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718319453; c=relaxed/simple;
	bh=TAWAlunhRer9pK1oqHFQnam5cbE0MFiar34KznrUQj8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=p0OpAZByCkfclX7mVZ/n8OQn6AXtOvefr4oAUNs/3eUkDr1i6Zkgl5G+O5RHbFupWXaRLc9EiyKpHFCHwYQSeV3yFApO/IitvRA/rEujEdnaVqBtpQL+0JBXgDr9s5q4kVVsNHcyTLQa6kRTl+e5tKP37BT6px2R+oaB3cLywD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=tkCPtIW+; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1718319447;
	bh=TAWAlunhRer9pK1oqHFQnam5cbE0MFiar34KznrUQj8=;
	h=From:Date:Subject:To:Cc:From;
	b=tkCPtIW+eXi1ELdwlWOXKVbhnigmAl76r12QbK6gdMiEZg61+mbLvk0HQzuRB/6Pm
	 vyFji9suCGoYylSHBIqBpUkWAMrwhb21sQj61ovIDvO+S0FfEvgt5BBqfN/PhZuci5
	 MxOpDojVU0Z1oJYx8dqY4NNkuVTYyuQ9MetSiAzY=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Fri, 14 Jun 2024 00:57:22 +0200
Subject: [PATCH] watchdog: Make watchdog_class const
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240614-class-const-wdt-v1-1-f9a4e2b1ba76@weissschuh.net>
X-B4-Tracking: v=1; b=H4sIAFF5a2YC/x3MQQqAIBBA0avErBvQlKCuEi1EpxoIDScqkO6et
 HyL/wsIZSaBsSmQ6WLhFCt024DfXFwJOVRDpzqrem3R704EfYpy4h1ONL0dgnLBW6OhVkemhZ/
 /OM3v+wF/Jgj1YQAAAA==
To: Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>
Cc: linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1718319446; l=889;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=TAWAlunhRer9pK1oqHFQnam5cbE0MFiar34KznrUQj8=;
 b=V9+f1ZCVwSkLyW0PeDbUT86IWAb+pZNwY3XkQNYs5IMIS0Pf/i3CdtV3dkzMd6AGbLbhT3RpJ
 rZx308ywsofD3mrdE18CCQCw+SHGG3hNuEtp1z6MZxr+u/SrSm4a5O8
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

Now that the driver core allows for struct class to be in read-only
memory, mark watchdog_class as const.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 drivers/watchdog/watchdog_dev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/watchdog/watchdog_dev.c b/drivers/watchdog/watchdog_dev.c
index e2bd266b1b5b..4190cb800cc4 100644
--- a/drivers/watchdog/watchdog_dev.c
+++ b/drivers/watchdog/watchdog_dev.c
@@ -1004,7 +1004,7 @@ static struct miscdevice watchdog_miscdev = {
 	.fops		= &watchdog_fops,
 };
 
-static struct class watchdog_class = {
+static const struct class watchdog_class = {
 	.name =		"watchdog",
 	.dev_groups =	wdt_groups,
 };

---
base-commit: d20f6b3d747c36889b7ce75ee369182af3decb6b
change-id: 20240614-class-const-wdt-3649d0adc431

Best regards,
-- 
Thomas Weißschuh <linux@weissschuh.net>


