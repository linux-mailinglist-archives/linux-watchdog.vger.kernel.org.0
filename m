Return-Path: <linux-watchdog+bounces-4712-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 346ACCCA173
	for <lists+linux-watchdog@lfdr.de>; Thu, 18 Dec 2025 03:33:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D4838302E152
	for <lists+linux-watchdog@lfdr.de>; Thu, 18 Dec 2025 02:31:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C58B2FC86C;
	Thu, 18 Dec 2025 02:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="i6CiTL2a"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from out203-205-221-231.mail.qq.com (out203-205-221-231.mail.qq.com [203.205.221.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 378E923D2B4;
	Thu, 18 Dec 2025 02:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.231
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766025116; cv=none; b=nvxN13aQAVaXwIfmpUhzhjB90ReYwznUIKGn1S80cUYxnHrMhCYRBC/9XE3tn62Gyll+xmd4MRxWSkWEhe1u3GJNAcqTUhrnbwa6XcdvFTMCid23wNFi2+n6yp4wU5OzS0XylILwLBlGC0Wpuqb6d/kUnUFo17yv1z7Bn8WoWgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766025116; c=relaxed/simple;
	bh=wjowIn/dJwCmhOvnLun/Ln4YCTq+YSmhk9EBPNLniRs=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=YXCoi+IHkKd+pzMZyV+Z986Q1Fsqs1Ce+2ak5mxX3rrAD5Ry0BAOkWy9ylRGOU0soMAJWd96Trbhgt56iqnSGd/9/ebFELKitpHyxAoRxHqxFbr2x1TLUNBM9zrf7pcb9K46IZLL/aj82qRRoN8G1K4bKaLCMG0ZK5KoldNqiwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=i6CiTL2a; arc=none smtp.client-ip=203.205.221.231
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1766025106; bh=p4TOcipS5V+WtYqpVWIWh2ySdNaEQILd8zoRBkch+DU=;
	h=From:To:Cc:Subject:Date;
	b=i6CiTL2aWofsKd3VCm95DBxjz5a0vmatKkXRpi6AAKpiLcNbcGmr2R8L93JKT7/gK
	 ZhTAFqQZ34iCpIiEmlgnDWl5jQev/oq1Dy8zQLy1HQbK0UlSwih342a9GkaIkfCX+l
	 nn+EKfMwKP6G4m9t3T2UFencTIRKhSiiILgJMFTc=
Received: from xg-virtual-machine.localdomain ([175.29.23.6])
	by newxmesmtplogicsvrsza56-0.qq.com (NewEsmtp) with SMTP
	id 7DA8DCD3; Thu, 18 Dec 2025 10:31:26 +0800
X-QQ-mid: xmsmtpt1766025086tmg3ne7ja
Message-ID: <tencent_E88A86F3126F065BA4E3D4FC9CEB1A9A2406@qq.com>
X-QQ-XMAILINFO: N/WmRbclY25GKqcCEengxveWjVVpbIgkP5W+ttLxfeGazQ+NXW+uy08zGjwGTh
	 ATPs5x6c9EdDpfLvr25xC4BNyJEAB9GTR0mEoOuuj0Ym1rufMGDVrHp1ccg/qVE24IX82J/iYhX6
	 oI/Ue7LlD9JQUivLqhOEwV28dnliFE4JMicmU5X0rh8MxREze0hOlJMAUAi8KkMMDSTBPy1iy5B9
	 6ZgxsRq86r+Rrt9zRDMzku8fCfxcylV8mfaDE9v8b7Hk0uXGkLzr8NaIONdC3VqNm9g3sg5JLuFw
	 0vlKSIKo0hbZD+DzDfYPHiRt+NSDLSt1z+bYktl8wT+sICim3yrus4Q9Fbu0xUToTBgZ7bSpFCp0
	 MZF+AkIN2lsPThePXcmMWDpSoKZHdjKX2PscIvJSoayLhySIsrOG6zf2ehkm8uWAjmDMr4IYsDt8
	 v+X6Q0boCsm9E5F54TnsRB5mRTrdR/rTLw+XQTo9nuNBtlritZeSeF8uC1J9SYMZTEMtT7t7Vbhf
	 nQoYcOTpUWOEzCKBChKDSSuyBHJl46QS88mSBVEm+IlsO0jCt3UukC+ZYvdo9pW+BLiEyauTiUlp
	 m+GQ0bL8WtOOSxPYu4wcQ3TZFTs65CUAzg+e0Dy/sBvZk2liJqB1/vwcLl+OPy/p7ivnYKtcGnw5
	 0ev0Xm+zSQyNtOF6il0B5ofqmovQLlYrM48kbD/IPMz8SXlr48wTVG8QRyNp5ebF6rYyc7Xi/zwm
	 vfEFuG0oZeRuPrzZWOAFabdC4caQLRRwwbc7FMIi+3WC4qL/+RCqL+2YEbo6UI9kaWT55c2pHFoZ
	 kPPqk+r2seu42gYaUxhTLJ+2K5sPi4G386ueaEJM6O4JO164GB2d6xaLZxXePu9qqGZ3M3IUPQvX
	 s/mjCHQJTlx9D92ozquexAdlMLSoaw+u6maNcwBBWDAlDN5XIPX/nGqONpOQTjZOS8WxIMyb68wJ
	 +sBiVpT4blaYGIhOlTFQkQ1Cegy9nlVhDd/MM1ZsgaBMSQeio7eHsuZVoFpt0c
X-QQ-XMRINFO: MPJ6Tf5t3I/ycC2BItcBVIA=
From: Zhu Ling <1536943441@qq.com>
To: linux-watchdog@vger.kernel.org
Cc: wim@linux-watchdog.org,
	linux@roeck-us.net,
	linux-kernel@vger.kernel.org,
	Zhu Ling <1536943441@qq.com>
Subject: [PATCH] watchdog: sbsa-gwdt: clamp timeout before updating wdd->timeout
Date: Thu, 18 Dec 2025 10:31:24 +0800
X-OQ-MSGID: <20251218023124.7288-1-1536943441@qq.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

sbsa_gwdt_set_timeout() updates wdd->timeout before clamping the user
requested value to the hardware-supported range. As a result,
WDIOC_GETTIMEOUT and sysfs may report a timeout larger than what is
actually programmed into the hardware.

Clamp the timeout first and then update wdd->timeout so that
userspace-visible values always reflect the effective hardware
timeout.

Signed-off-by: Zhu Ling <1536943441@qq.com>
---
 drivers/watchdog/sbsa_gwdt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/watchdog/sbsa_gwdt.c b/drivers/watchdog/sbsa_gwdt.c
index 6ce1bfb39..826469645 100644
--- a/drivers/watchdog/sbsa_gwdt.c
+++ b/drivers/watchdog/sbsa_gwdt.c
@@ -155,8 +155,8 @@ static int sbsa_gwdt_set_timeout(struct watchdog_device *wdd,
 {
 	struct sbsa_gwdt *gwdt = watchdog_get_drvdata(wdd);
 
-	wdd->timeout = timeout;
 	timeout = clamp_t(unsigned int, timeout, 1, wdd->max_hw_heartbeat_ms / 1000);
+	wdd->timeout = timeout;
 
 	if (action)
 		sbsa_gwdt_reg_write((u64)gwdt->clk * timeout, gwdt);
-- 
2.34.1


